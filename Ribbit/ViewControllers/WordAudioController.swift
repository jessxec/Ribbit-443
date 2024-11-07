//
//  WordViewController.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/2/24.
//

import AVFoundation
import Foundation
import FirebaseStorage

<<<<<<< HEAD:Ribbit/ViewControllers/WordAudioController.swift
class WordAudioController: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
=======
class WordViewController: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
  @Published var feedbackMessage: String?
>>>>>>> 4d9c023 (Added API connections between Python Anywhere and Swift):Ribbit/ViewControllers/WordViewController.swift
  @Published var status: AudioStatus = .recordingStopped
  @Published var hasRecorded: Bool = false
  @Published var hasMicAccess = false
  @Published var duration = 3
  @Published var durationTimer: Timer?
  
  var audioPlayer: AVAudioPlayer?
  var audioRecorder: AVAudioRecorder?
  var timer: Timer?
  let word: Word
  
  
  init(word: Word) {
    self.word = word
    super.init() // Call the superclass initializer
    setupAudioSession() // Setup audio player
    requestMicrophoneAccess() // Request microphone access
  }
  
  // MARK: Setup Audio Session
  private func setupAudioSession() {
    let session  = AVAudioSession.sharedInstance()
    do {
      try session.setCategory(.playAndRecord, options: .defaultToSpeaker)
      try session.setActive(true)
    } catch {
      print ("Error setting up audio session: \(error.localizedDescription)")
    }
  }
  
  // MARK: Request Microphone Access
  private func requestMicrophoneAccess() {
    AVAudioSession.sharedInstance().requestRecordPermission { granted in
      DispatchQueue.main.async {
        self.hasMicAccess = granted
        if !granted {
          print("Microphone access denied")
        }
      }
    }
  }
  
  
  // MARK: Playing Audio
  func playSampleWord(for samplePath: String) {
    let storageRef = Storage.storage().reference().child("\(samplePath)")
        
        // Create a unique temporary URL for this audio file
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).m4a")
        
        storageRef.write(toFile: tempURL) { [weak self] url, error in
            guard let self = self, error == nil else {
                print("Error fetching audio URL from Firebase: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Check if file exists at tempURL
            guard FileManager.default.fileExists(atPath: tempURL.path) else {
                print("Downloaded file does not exist at path: \(tempURL.path)")
                return
            }
            
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: tempURL)
                self.audioPlayer?.delegate = self
                self.audioPlayer?.play()
                self.status = .playing
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
  }
  
  func playRecording() {
    // play temp file
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: urlForRecording)
      audioPlayer?.delegate = self
      audioPlayer?.play()
      status = .playing
    } catch {
      print("Error playing recorded audio: \(error.localizedDescription)")
    }
  }
  
  func stopPlayback() {
    audioPlayer?.stop()
    status = .stopped // Update the playback state
  }
  
  
  // MARK: Recording Audio
  var urlForRecording: URL {
    let fileManager = FileManager.default
    let tempDir = fileManager.temporaryDirectory
    let filePath = "temp.wav"
    return tempDir.appendingPathComponent(filePath)
  }
  
  func setupRecorder() {
    let recordingSettings: [String: Any] = [
      AVFormatIDKey: Int(kAudioFormatLinearPCM),
      AVSampleRateKey: 44100.0,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.medium.rawValue
    ]
    
    do {
      audioRecorder = try AVAudioRecorder(url: urlForRecording, settings: recordingSettings)
      audioRecorder?.delegate = self
      hasRecorded = false
      
      if let recorder = audioRecorder {
        if !recorder.prepareToRecord() {
          print("Error preparing to record.")
        }
      } else {
        print("Recorder is nil after initialization.")
      }
    } catch {
      print("Error initializing recorder: \(error.localizedDescription)")
    }
  }
  
  func startRecording(for duration: TimeInterval, completion: @escaping (String) -> Void) {
    setupRecorder()
    
    if let recorder = audioRecorder, recorder.prepareToRecord() {
      recorder.record()
      status = .recording
      
      timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { [weak self] _ in
        self?.stopRecording(completion: completion)
      }
    } else {
      print("Recorder not ready or setup failed.")
      status = .recordingStopped
      completion("Error")
    }
  }
  
  func stopRecording(completion: @escaping (String) -> Void) {
      audioRecorder?.stop()
      status = .recordingStopped
      
      if FileManager.default.fileExists(atPath: urlForRecording.path) {
          if let attributes = try? FileManager.default.attributesOfItem(atPath: urlForRecording.path),
             let fileSize = attributes[.size] as? UInt64, fileSize > 0 {
              
              // Define a sample pitch (replace with actual values as needed)
              let samplePitch: [Double] = [154.4,150.0,148.1,148.6,148.4,147.8,148.3,149.3,150.0,150.6,150.3,150.4,150.9,150.6,148.7,147.3,148.4,150.1,152.8,155.5]
              
              // Send the audio to the API
              sendAudioToAPI(samplePitch: samplePitch) { result in
                  switch result {
                  case .success(let response):
                      print("API call success: \(response)")
                  case .failure(let error):
                      print("API call failed: \(error.localizedDescription)")
                  }
              }
          } else {
              print("Recorded file is empty.")
              completion("Error")
          }
      } else {
          print("Recorded file does not exist.")
          completion("Error")
      }
  }


  
  func sendAudioToAPI(samplePitch: [Double], completion: @escaping (Result<String, Error>) -> Void) {
      let url = URL(string: "https://jacksun815.pythonanywhere.com/process_audio")!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      
      let boundary = "Boundary-\(UUID().uuidString)"
      request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
      
      var data = Data()
      
      // Add audio file
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"audio\"; filename=\"\(urlForRecording.lastPathComponent)\"\r\n".data(using: .utf8)!)
      data.append("Content-Type: audio/wav\r\n\r\n".data(using: .utf8)!)
      data.append(try! Data(contentsOf: urlForRecording))
      data.append("\r\n".data(using: .utf8)!)
      
      // Add sample pitch values
      let samplePitchString = samplePitch.map { "\($0)" }.joined(separator: ",")
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"sample_pitch\"\r\n\r\n".data(using: .utf8)!)
      data.append("[\(samplePitchString)]".data(using: .utf8)!)
      data.append("\r\n".data(using: .utf8)!)
      
      data.append("--\(boundary)--\r\n".data(using: .utf8)!)
      request.httpBody = data
      
      // Send the request
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
          if let error = error {
              completion(.failure(error))
              return
          }
          
          guard let data = data else {
              completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
              return
          }
          
          do {
              if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                  // Print the full JSON response for debugging
                  print("Full JSON response: \(json)")
                  
                  // Check for pitch values and feedback in the response
                  if let pitchValues = json["pitch_values"] as? [Double],
                     let feedback = json["feedback"] as? [String: Any],
                     let averageFeedback = feedback["average_feedback"] as? String,
                     let detailedFeedback = feedback["detailed_feedback"] as? [String] {
                      
                      // Assign feedback message for UI
                      DispatchQueue.main.async {
                          self.feedbackMessage = "Average feedback: \(averageFeedback)\nDetails:\n" + detailedFeedback.joined(separator: "\n")
                      }
                      
                      // Print pitch values and feedback for debugging
                      print("Pitch Values: \(pitchValues)")
                      print("Feedback - Average: \(averageFeedback)")
                      print("Feedback - Details: \(detailedFeedback)")
                      
                      completion(.success("Feedback and pitch values received successfully"))
                  } else {
                      completion(.failure(NSError(domain: "Invalid JSON structure", code: 0, userInfo: nil)))
                  }
              } else {
                  completion(.failure(NSError(domain: "Invalid JSON", code: 0, userInfo: nil)))
              }
          } catch {
              completion(.failure(error))
          }
      }
      task.resume()
  }

  
  var audioDuration: TimeInterval {
    audioPlayer?.duration ?? 0
  }
  

}



extension WordAudioController {

  // MARK: AVAudioPlayerDelegate Method
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    if flag {
      print("Audio finished playing")
      DispatchQueue.main.async {
        self.status = .stopped
      }
    }
  }
  
  // MARK: AVAudioRecorderDelegate Method
  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    if flag {
      print("Audio finished recording")
      DispatchQueue.main.async {
        self.status = .recordingStopped
        self.hasRecorded = true
      }
    }
  }
}
