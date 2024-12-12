from flask import Flask, request, jsonify, make_response
from scipy.interpolate import interp1d
import os
import parselmouth
import numpy as np
import logging
import json

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

# Pitch analysis endpoint
@app.route('/process_audio', methods=['POST'])
def process_audio():
    try:
        if 'audio' not in request.files or 'sample_pitch' not in request.form:
            logging.info("No audio file or sample pitch values provided")
            return jsonify(error="No audio file or sample pitch values provided"), 400

        audio_file = request.files['audio']
        audio_path = '/tmp/' + audio_file.filename
        audio_file.save(audio_path)
        logging.info(f"Audio file saved to {audio_path}")

        sample_pitch_raw = request.form['sample_pitch']
        try:
            sample_pitch = json.loads(sample_pitch_raw)
            logging.info(f"Sample pitch values received: {sample_pitch}")
        except json.JSONDecodeError as e:
            logging.error(f"Error decoding sample_pitch JSON: {e}")
            return jsonify(error="Invalid format for sample_pitch"), 400

        # Run pitch analysis
        user_pitch_values = run_pitch_analysis(audio_path)
        if not user_pitch_values:
            logging.error("Failed to retrieve pitch values from the audio file.")
            return jsonify(error="Failed to retrieve pitch values"), 500

        os.remove(audio_path)

        pitch_normalized = pitch_height_normalization(user_pitch_values)
        feedback = generate_feedback(pitch_normalized, sample_pitch)

        # Return pitch values and feedback as JSON
        response_data = {
            "pitch_values": pitch_normalized,
            "feedback": {
                "average_feedback": feedback["average_feedback"],
                "section_feedback": feedback["section_feedback"],
                "tone_pattern_feedback": feedback["tone_pattern_feedback"]
            }
        }

        return jsonify(response_data), 200

    except Exception as e:
        logging.error(f"Error processing audio: {str(e)}")
        return jsonify(error="Internal server error"), 500

@app.route('/process_two_characters', methods=['POST'])
def process_two_characters():
    try:
        # Ensure the audio file is provided
        if 'audio' not in request.files:
            logging.info("No audio file provided")
            return jsonify(error="No audio file provided"), 400

        # Save the audio file
        audio_file = request.files['audio']
        audio_path = '/tmp/' + audio_file.filename
        audio_file.save(audio_path)
        logging.info(f"Audio file saved to {audio_path}")

        # Run pitch analysis with splitting for two characters
        segments = split_pitch_into_two_characters(audio_path)
        if not segments:
            logging.error("Failed to retrieve pitch segments from the audio file.")
            return jsonify(error="Failed to retrieve pitch segments"), 500

        # Delete the temporary file
        os.remove(audio_path)

        # Return segmented pitch values as JSON
        response_data = {
            "character_1": segments["character_1"],
            "character_2": segments["character_2"],
        }
        return jsonify(response_data), 200

    except Exception as e:
        logging.error(f"Error processing audio: {str(e)}")
        return jsonify(error="Internal server error"), 500
def split_pitch_into_two_characters(audio_path):
    try:
        logging.info(f"Starting pitch analysis for {audio_path}")
        sound = parselmouth.Sound(audio_path)
        pitch = sound.to_pitch()
        pitch_values = pitch.selected_array['frequency']
        time_values = pitch.xs()

        logging.info(f"Extracted pitch values: {pitch_values}")
        logging.info(f"Extracted time values: {time_values}")

        # Identify non-zero pitch values
        valid_indices = np.where(pitch_values > 50)[0]
        if len(valid_indices) == 0:
            logging.error("No valid pitch values detected.")
            return None

        logging.info(f"Valid indices: {valid_indices}")

        # Use zeros to split into groups
        groups = []
        current_group = []

        for idx in range(len(pitch_values)):
            if pitch_values[idx] > 50:  # Valid pitch
                current_group.append(idx)
            elif current_group:  # End of a group
                groups.append(current_group)
                current_group = []

        if current_group:
            groups.append(current_group)

        logging.info(f"Raw groups: {groups}")

        # Filter groups by size
        min_group_size = 5  # Minimum number of frames for a group to be valid
        groups = [group for group in groups if len(group) >= min_group_size]

        if len(groups) < 2:
            logging.error("Not enough valid groups detected for two characters.")
            return None

        # Select the two largest groups
        groups = sorted(groups, key=len, reverse=True)[:2]

        logging.info(f"Filtered groups: {groups}")

        # Extract pitch values for each group
        char_1 = [pitch_values[idx] for idx in groups[0]]
        char_2 = [pitch_values[idx] for idx in groups[1]]

        # Resample each character's pitch data to 20 points
        char_1_resampled = resample_to_fixed_length(char_1, target_length=20)
        char_2_resampled = resample_to_fixed_length(char_2, target_length=20)

        # Round each pitch value to 1 decimal point
        char_1_resampled = [round(value, 1) for value in char_1_resampled]
        char_2_resampled = [round(value, 1) for value in char_2_resampled]

        logging.info(f"Resampled and rounded character 1 pitch: {char_1_resampled}")
        logging.info(f"Resampled and rounded character 2 pitch: {char_2_resampled}")

        return {"character_1": char_1_resampled, "character_2": char_2_resampled}

    except Exception as e:
        logging.error(f"Error splitting pitch: {e}")
        return None



# Formant analysis endpoint
@app.route('/check_formants', methods=['POST'])
def check_formants():
    try:
        if 'audio' not in request.files or 'reference_formants' not in request.form:
            logging.info("No audio file or reference formant values provided")
            return jsonify(error="No audio file or reference formant values provided"), 400

        audio_file = request.files['audio']
        audio_path = '/tmp/' + audio_file.filename
        audio_file.save(audio_path)
        logging.info(f"Audio file saved to {audio_path}")

        # Parse the reference formants
        try:
            reference_formants = json.loads(request.form['reference_formants'])
            ref_f1 = reference_formants.get('F1')
            ref_f2 = reference_formants.get('F2')
            if ref_f1 is None or ref_f2 is None:
                raise ValueError("Reference F1 and F2 values must be provided")
            logging.info(f"Reference formants: F1={ref_f1}, F2={ref_f2}")
        except (json.JSONDecodeError, ValueError) as e:
            logging.error(f"Error decoding reference formants: {e}")
            return jsonify(error="Invalid format for reference formants"), 400

        # Extract formants from the audio
        formants = extract_formants_with_pitch(audio_path)
        if not formants:
            logging.error("Failed to extract formants from the audio file.")
            return jsonify(error="Failed to extract formants"), 500

        # Compare formants and provide feedback
        feedback = analyze_formants(formants, ref_f1, ref_f2)
        logging.info(f"Feedback: {feedback}")

        response_data = {
            "formants": formants,
            "feedback": feedback
        }

        return jsonify(response_data), 200

    except Exception as e:
        logging.error(f"Error checking formants: {str(e)}")
        return jsonify(error="Internal server error"), 500

# Utility functions for pitch analysis
def run_pitch_analysis(audio_path, target_length=20, min_time_step=0.005, max_time_step=0.02):
    try:
        sound = parselmouth.Sound(audio_path)
        time_step = max_time_step
        pitch = sound.to_pitch_ac(time_step=time_step, pitch_floor=50, pitch_ceiling=300)
        pitch_values = pitch.selected_array['frequency']
        valid_indices = np.where(pitch_values > 50)[0]

        while len(valid_indices) < target_length and time_step > min_time_step:
            time_step /= 2
            pitch = sound.to_pitch_ac(time_step=time_step, pitch_floor=50, pitch_ceiling=300)
            pitch_values = pitch.selected_array['frequency']
            valid_indices = np.where(pitch_values > 50)[0]

        pitch_values = np.array([p if p is not None and p > 50 else np.nan for p in pitch_values])
        start_index = next((i for i, val in enumerate(pitch_values) if not np.isnan(val)), 0)
        pitch_values = pitch_values[start_index:]
        valid_indices = np.where(~np.isnan(pitch_values))[0]

        if len(valid_indices) < target_length:
            logging.error("Not enough valid voiced frames even after adjusting time step.")
            return []

        indices = np.linspace(0, len(valid_indices) - 1, target_length).astype(int)
        pitch_values_resampled = pitch_values[valid_indices][indices]

        return [round(p, 1) for p in pitch_values_resampled]

    except Exception as e:
        logging.error(f"Error in pitch analysis: {e}")
        return []

def pitch_height_normalization(pitch_values):
    pitch_average = sum(pitch_values) / len(pitch_values)
    return [round(value - pitch_average + 150, 1) for value in pitch_values]

def generate_feedback(user_pitch, sample_pitch):
    differences = np.array(user_pitch) - np.array(sample_pitch)
    avg_difference = np.mean(np.abs(differences))
    feedback = f"Average pitch difference: {avg_difference:.2f}. "
    feedback += "Your pitch closely matches the sample!" if avg_difference < 10 else "Try to match the pitch more closely."

    third_length = len(user_pitch) // 3
    beginning, middle, end = user_pitch[:third_length], user_pitch[third_length:2*third_length], user_pitch[2*third_length:]
    sample_beginning, sample_middle, sample_end = sample_pitch[:third_length], sample_pitch[third_length:2*third_length], sample_pitch[2*third_length:]

    section_feedback = [
        analyze_section(beginning, sample_beginning, "beginning"),
        analyze_section(middle, sample_middle, "middle"),
        analyze_section(end, sample_end, "end")
    ]

    tone_pattern_feedback = "Tone 1 should be flat, but your pitch increased slightly." if np.polyfit(range(len(user_pitch)), user_pitch, 1)[0] > 0 else "Tone 1 is expected to be flat. Your pitch was relatively stable."

    return {
        "average_feedback": feedback,
        "section_feedback": section_feedback,
        "tone_pattern_feedback": tone_pattern_feedback
    }

def analyze_section(user_section, sample_section, section_name):
    user_slope = np.polyfit(range(len(user_section)), user_section, 1)[0]
    sample_slope = np.polyfit(range(len(sample_section)), sample_section, 1)[0]
    if abs(user_slope - sample_slope) < 0.1:
        return f"The {section_name} of your pitch is well-matched to the sample's flatness."
    return f"The {section_name} of your pitch is {'rising too much' if user_slope > sample_slope else 'falling more than expected'}. Try to keep it steady."

# Utility functions for formant analysis
def extract_formants_with_pitch(audio_path, target_length=20):
    try:
        sound = parselmouth.Sound(audio_path)
        pitch = sound.to_pitch()
        formant = sound.to_formant_burg(time_step=0.01, max_number_of_formants=5)

        pitch_values = pitch.selected_array['frequency']
        time_values = pitch.xs()
        f1_values, f2_values = [], []

        for t in time_values:
            f1_values.append(formant.get_value_at_time(1, t))
            f2_values.append(formant.get_value_at_time(2, t))

        valid_indices = np.where(pitch_values > 50)[0]
        if len(valid_indices) == 0:
            return None

        f1_valid = [f1_values[i] for i in valid_indices]
        f2_valid = [f2_values[i] for i in valid_indices]

        f1_avg = round(np.nanmean(resample_to_fixed_length(f1_valid, target_length)), 1)
        f2_avg = round(np.nanmean(resample_to_fixed_length(f2_valid, target_length)), 1)

        return {"F1": f1_avg, "F2": f2_avg}

    except Exception as e:
        logging.error(f"Error extracting formants: {e}")
        return None

def analyze_formants(formants, ref_f1, ref_f2, f1_tolerance=200, f2_tolerance=400):
    f1, f2 = formants["F1"], formants["F2"]
    feedback = []

    if f1 < ref_f1 - f1_tolerance:
        feedback.append("Raise your tongue.")
    elif f1 > ref_f1 + f1_tolerance:
        feedback.append("Lower your tongue.")

    if f2 < ref_f2 - f2_tolerance:
        feedback.append("Retract your tongue.")
    elif f2 > ref_f2 + f2_tolerance:
        feedback.append("Advance your tongue.")

    return feedback

def resample_to_fixed_length(data, target_length=20):
    original_indices = np.linspace(0, 1, len(data))
    target_indices = np.linspace(0, 1, target_length)
    interpolator = interp1d(original_indices, data, kind='linear', fill_value="extrapolate")
    return interpolator(target_indices)

if __name__ == "__main__":
    app.run(debug=True, port=5050)
