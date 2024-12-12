# Ribbit: A Language Visualization App

Ribbit is a language learning app designed to help users improve their pronunciation through **pitch contour visualization** and **real-time feedback**. The app leverages  speech recognition techniques, user-friendly visualizations, and a gamified learning experience to make language acquisition engaging and effective.

---

## Features

- **Pitch Contour Visualization**: Feedback on pronunciation accuracy using pitch contour graphs.
- **Gamified Learning**: Stars and badges to reward accurate pronunciation and encourage continued learning.
- **Dynamic Feedback**: Personalized feedback based on user performance, comparing user pitch to native speaker samples.
- **Modular Lessons**: Lessons structured into progressive modules, each focusing on specific language aspects and theme. Here's a short overview of the modules provided in the current version:
    1. Foundations Island
    2. Navigating Through the Airport
    3. Sunny Day at the Beach
    4. Ordering at a Cafe
    5. Let's Go Camping
- **Audio Processing API**: A custom external API for analyzing user audio input and extracting pitch values for feedback.
- **Firebase Integration**: Used to store user data and track learning progress across modules.

---

## Technologies Used

### Frontend
- **Swift**: iOS development for smoother user experience.

### Backend
- **Firebase**: For storing user data, managing authentication, and tracking progress.
- **Python**: Custom-built audio processing API for pitch analysis and feedback. Voice analysis done on Python Anywhere: https://www.pythonanywhere.com/user/JackSun815/shares/4d1ea9279ea74aef80b725b27afebc0b/
  

### Tools
- **Montreal Forced Aligner**: Used to align user audio with phoneme targets for accurate pronunciation analysis.
- **Parselmouth**: Integrated into the backend for audio pitch analysis.

---

## Installation

### Prerequisites
- **Xcode** (latest version) for running the app on an iOS device or simulator.
- **Python 3.11** with the necessary libraries for running the backend API.

### Steps
1. Clone the repository:
   ```bash
   git clone [https://github.com/yourusername/your-repo-name.git](https://github.com/jessxec/Ribbit-443.git)
   cd your-repo-name
   ```
2. Install the required Python dependencies for the backend:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up Firebase for your app:
   - Add your `GoogleService-Info.plist` file to the Xcode project.
4. Run the backend API:
   ```bash
   python api.py
   ```
5. Build and run the app on Xcode:
   - Open the `.xcodeproj` file in Xcode.
   - Build and run the app on a simulator or connected iOS device.

---

## How It Works

1. **User Recording**: Users record their pronunciation of words or sentences.
2. **Audio Processing**:
   - Audio is uploaded to a custom API for pitch extraction.
   - The API compares user pitch with native speaker samples.
3. **Feedback & Visualization**:
   - Real-time pitch contours are displayed alongside target contours.
   - Users receive feedback based on tone accuracy, pitch flatness, and more.
4. **Progress Tracking**:
   - Firebase tracks user performance, stars, and badges for motivation.

---

## API Details

### Endpoints
#### `/process_audio`
- **Method**: POST
- **Parameters**:
  - `audio`: User audio file (e.g., `.wav` or `.mp3`).
  - `sample_pitch`: JSON array of target pitch values.
- **Response**:
  - `pitch_values`: Normalized pitch values from user audio.
  - `feedback`: Detailed feedback on pronunciation.

---

