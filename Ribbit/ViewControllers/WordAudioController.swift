//
//  WordViewController.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/2/24.
//

import AVFoundation
import Foundation
import FirebaseStorage
import SwiftUI
import AVFoundation
import Foundation
import FirebaseStorage
import SwiftUI

class WordAudioController: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
  @Published var feedbackMessage: String?
  @Published var status: AudioStatus = .recordingStopped
  @Published var hasRecorded: Bool = false
  @Published var hasMicAccess = false
  @Published var duration = 3
  @Published var durationTimer: Timer?
  @Published var playingUserAudio: Bool = false
  @Published var animationProgress: Double = 0.0
  @Published var pitchValues: [Double] = []
  @Published var collectedStars: Int = 0
  @Published var totalCollectedStars: Int = 0
  @Published var isPlaying: Bool = false
  @Published var isCalibrating: Bool = false
  @Published var isPlayingSampleAudio: Bool = false
  @Published var f0Range: (low: Double, high: Double)?


  var hasSentAPIRequest = false // Flag to prevent multiple API calls
  var hasPlayedBackRecording = false // Prevents duplicate playback
  var audioPlayer: AVAudioPlayer?
  var audioRecorder: AVAudioRecorder?
  var timer: Timer?
  var animationTimer: Timer? // Track existing animation timer
  let word: Word?
  
  
  init(word: Word? = nil) {
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

  
  // Helper Function to Parse the Response
  func parseResponse(data: Data) -> [String: Any]? {
      do {
          if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
              return json
          }
      } catch {
          print("JSON parsing error: \(error.localizedDescription)")
      }
      return nil
  }

  
  
  // MARK: Playing Audio
  func playSampleWord(for samplePath: String) {
      print("🔊 playSampleWord() called for \(samplePath)")

      let storageRef = Storage.storage().reference().child("\(samplePath)")
      let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).m4a")

      storageRef.write(toFile: tempURL) { [weak self] url, error in
          guard let self = self, error == nil else {
              print("Error fetching audio URL from Firebase: \(error?.localizedDescription ?? "Unknown error")")
              return
          }

          guard FileManager.default.fileExists(atPath: tempURL.path) else {
              print("Downloaded file does not exist at path: \(tempURL.path)")
              return
          }

          do {
              self.audioPlayer = try AVAudioPlayer(contentsOf: tempURL)
              self.audioPlayer?.delegate = self
              self.audioPlayer?.play()
              self.status = .playing
              self.playingUserAudio = false
              self.isPlayingSampleAudio = true // Set flag for sample audio

              print("✅ Audio started playing, triggering animation...")

              // Reset animation progress for sample audio
              self.animationProgress = 0.0
              self.startAnimation(duration: self.audioDuration)

          } catch {
              print("Error playing audio: \(error.localizedDescription)")
          }
      }
  }
  
  func playRecording() {
      print("🎬 playRecording called")
      guard let word = word else {
          print("Error: No word provided.")
          return
      }

      guard !isPlaying, let audioPlayer = try? AVAudioPlayer(contentsOf: urlForRecording) else {
          print("Audio is already playing or failed to initialize audio player.")
          return
      }

      self.audioPlayer = audioPlayer
      audioPlayer.delegate = self
      audioPlayer.play()
      isPlaying = true
      status = .playing
      playingUserAudio = true

      // ✅ Ensure animation only starts if it's not already running
      if animationTimer == nil {
          print("🎬 Triggering animation from playRecording()")
          animationProgress = 0.0 // Reset animation progress for playback
          startAnimation(duration: audioDuration)
      } else {
          print("🚨 Skipping animation because it was already running.")
      }

      collectedStars = calculateHighlightedStars(userPitchValues: pitchValues, correctValues: word.samplePitchVectors)
  }
  
  // MARK: play asset audio files
  func playAssetAudio(forTone tone: Int) {
    let toneSound = "tone\(tone).wav"
    print("Attempting to play sound: \(toneSound)")
    
    if let soundURL = Bundle.main.url(forResource: toneSound, withExtension: "mp3") {
      do {
        print("Playing sound: \(toneSound)")
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer?.play()
      } catch {
        print("Error playing sound: \(error)")
      }
    } else {
      print("Sound not found for \(toneSound)")
    }
  }
  
  func stopPlayback() {
    audioPlayer?.stop()
    status = .stopped // Update the playback state
    resetAnimation()
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
  func stopRecording(completion: @escaping (String) -> Void) {
      guard !hasSentAPIRequest else {
          print("🛑 stopRecording already in progress. Skipping duplicate.")
          return
      }
      
      print("🛑 stopRecording called")
      audioRecorder?.stop()
      status = .recordingStopped

      guard FileManager.default.fileExists(atPath: urlForRecording.path) else {
          print("Recorded file does not exist.")
          completion("Recording file not found.")
          return
      }

      guard let word = word else {
          print("Error: No word provided.")
          completion("No word data available.")
          return
      }

      hasSentAPIRequest = true // Mark API request as in progress

      sendPitchToAPI(samplePitch: word.samplePitchVectors) { pitchResult in
          DispatchQueue.main.async {
              switch pitchResult {
              case .success(let response):
                  self.pitchValues = response.pitch_values
                  let newStars = self.calculateHighlightedStars(
                      userPitchValues: self.pitchValues,
                      correctValues: word.samplePitchVectors
                  )

                  if self.collectedStars == 0 {
                      self.collectedStars = newStars
                      self.totalCollectedStars += newStars
                  }

                  self.feedbackMessage = response.average_feedback

                  // ✅ Ensure playback happens only once
                  if !self.hasPlayedBackRecording {
                      self.hasPlayedBackRecording = true // Set flag before playback
                      self.playRecording()
                  } else {
                      print("🚨 Preventing duplicate playback")
                  }

                  self.hasSentAPIRequest = false
              case .failure(let error):
                  print("Pitch API error: \(error.localizedDescription)")
                  self.feedbackMessage = "Pitch analysis failed. Try again."
                  self.hasSentAPIRequest = false
              }
          }
      }
  }



  func startRecording(for duration: TimeInterval, completion: @escaping (String) -> Void) {
      setupRecorder()

      // Reset flags and state
      hasPlayedBackRecording = false
      hasSentAPIRequest = false
      totalCollectedStars -= collectedStars
      collectedStars = 0
      animationProgress = 0.0 // Reset animation progress for new recording

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



  
  
  
  // MARK: API Calls for Pitch and Formant Analysis
  func sendPitchToAPI(samplePitch: [Double], completion: @escaping (Result<PitchResponse, Error>) -> Void) {
      let url = URL(string: "https://jacksun815.pythonanywhere.com/process_audio")!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
    

    
      let boundary = "Boundary-\(UUID().uuidString)"
      request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

      var data = Data()
      print("🛠 Sending request to API:", request)
      print("🛠 Request Headers:", request.allHTTPHeaderFields ?? [:])
      print("🛠 Request Body Size:", data.count)
      // Ensure word is available
      guard let word = word else {
          print("❌ Error: No word data available.")
          completion(.failure(NSError(domain: "Word not found", code: 404, userInfo: nil)))
          return
      }
    

      let recordedFileURL = self.urlForRecording
      guard FileManager.default.fileExists(atPath: recordedFileURL.path) else {
          print("❌ Error: Recorded file does not exist at path: \(recordedFileURL.path)")
          completion(.failure(NSError(domain: "File not found", code: 404, userInfo: nil)))
          return
      }

      do {
          let audioData = try Data(contentsOf: recordedFileURL)

          // ✅ Attach audio file
          data.append("--\(boundary)\r\n".data(using: .utf8)!)
          data.append("Content-Disposition: form-data; name=\"audio\"; filename=\"\(recordedFileURL.lastPathComponent)\"\r\n".data(using: .utf8)!)
          data.append("Content-Type: audio/wav\r\n\r\n".data(using: .utf8)!)
          data.append(audioData)
          data.append("\r\n".data(using: .utf8)!)

          // ✅ Attach character (word in Chinese)
          data.append("--\(boundary)\r\n".data(using: .utf8)!)
          data.append("Content-Disposition: form-data; name=\"character\"\r\n\r\n".data(using: .utf8)!)
          data.append("\(word.word)".data(using: .utf8)!)
          data.append("\r\n".data(using: .utf8)!)

          // ✅ Attach sample pitch values
          let samplePitchString = samplePitch.map { "\($0)" }.joined(separator: ",")
          data.append("--\(boundary)\r\n".data(using: .utf8)!)
          data.append("Content-Disposition: form-data; name=\"sample_pitch\"\r\n\r\n".data(using: .utf8)!)
          data.append("[\(samplePitchString)]".data(using: .utf8)!)
          data.append("\r\n".data(using: .utf8)!)
          data.append("--\(boundary)--\r\n".data(using: .utf8)!)

          request.httpBody = data

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ API Request Error:", error.localizedDescription)
                completion(.failure(error))
                return
            }

            guard let data = data else {
                print("🚨 No data received from API!")
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }

            // ✅ PRINT RAW RESPONSE
            if let responseString = String(data: data, encoding: .utf8) {
                print("🌐 RAW API Response: ", responseString)
            } else {
                print("🚨 Failed to decode API response as a string")
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PitchResponse.self, from: data)

                DispatchQueue.main.async {
                    print("🎯 Successfully Decoded Pitch Response!")
                    print("🎯 Pitch values:", response.pitch_values)

                    self.pitchValues = response.pitch_values
                    let newStars = self.calculateHighlightedStars(
                        userPitchValues: self.pitchValues,
                        correctValues: samplePitch
                    )

                    if self.collectedStars == 0 {
                        self.collectedStars = newStars
                        self.totalCollectedStars += newStars
                    }

                    self.feedbackMessage = response.average_feedback
                    if !self.hasPlayedBackRecording {
                        self.hasPlayedBackRecording = true
                        self.playRecording()
                    } else {
                        print("🚨 Preventing duplicate playback")
                    }

                    self.hasSentAPIRequest = false
                    completion(.success(response))
                }
            } catch {
                print("🚨 JSON Decoding Error:", error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
      } catch {
          print("❌ Error reading recorded file: \(error.localizedDescription)")
          completion(.failure(error))
      }
  }
  
  
  func sendTwoCharactersToAPI(completion: @escaping (Result<[String: [Double]], Error>) -> Void) {
      let url = URL(string: "https://jacksun815.pythonanywhere.com/process_two_characters")!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      
      let boundary = "Boundary-\(UUID().uuidString)"
      request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
      
      var data = Data()
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"audio\"; filename=\"\(urlForRecording.lastPathComponent)\"\r\n".data(using: .utf8)!)
      data.append("Content-Type: audio/wav\r\n\r\n".data(using: .utf8)!)
      data.append(try! Data(contentsOf: urlForRecording))
      data.append("\r\n".data(using: .utf8)!)
      data.append("--\(boundary)--\r\n".data(using: .utf8)!)
      
      request.httpBody = data
      
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
              let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: [Double]]
              completion(.success(json ?? [:]))
          } catch {
              completion(.failure(error))
          }
      }
      task.resume()
  }
  
  // API Call for Voice Calibration 
  struct F0Response: Codable {
      let f0_low: Double
      let f0_high: Double
      let low_time: Double
      let high_time: Double
      let recommended_range: RecommendedRange

      struct RecommendedRange: Codable {
          let low: Double
          let high: Double
      }
  }
  func startVoiceCalibration() {
      setupRecorder()
      
      if let recorder = audioRecorder, recorder.prepareToRecord() {
          isCalibrating = true
          recorder.record()
          status = .recording
      } else {
          print("Recorder not ready for calibration.")
      }
  }

  func stopVoiceCalibration() {
      audioRecorder?.stop()
      isCalibrating = false
      status = .recordingStopped

      guard FileManager.default.fileExists(atPath: urlForRecording.path) else {
          print("Calibration file not found.")
          return
      }

      uploadCalibrationAudio()
  }
  private func uploadCalibrationAudio() {
      guard let audioData = try? Data(contentsOf: urlForRecording) else {
          print("Failed to read recorded file")
          return
      }

      let url = URL(string: "https://jacksun815.pythonanywhere.com/voice_calibration")!
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      
      let boundary = "Boundary-\(UUID().uuidString)"
      request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
      
      var data = Data()
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"audio\"; filename=\"recording.wav\"\r\n".data(using: .utf8)!)
      data.append("Content-Type: audio/wav\r\n\r\n".data(using: .utf8)!)
      data.append(audioData)
      data.append("\r\n".data(using: .utf8)!)
      data.append("--\(boundary)--\r\n".data(using: .utf8)!)
      
      request.httpBody = data

      let task = URLSession.shared.dataTask(with: request) { data, response, error in
          if let error = error {
              print("Voice Calibration API error: \(error.localizedDescription)")
              return
          }

          guard let data = data else {
              print("No data received from calibration API.")
              return
          }

          do {
              let decoder = JSONDecoder()
              let result = try decoder.decode(F0Response.self, from: data)
              DispatchQueue.main.async {
                  self.f0Range = (low: result.f0_low, high: result.f0_high)
                  print("✅ Detected Pitch Range: \(self.f0Range!.low)Hz - \(self.f0Range!.high)Hz")
              }
          } catch {
              print("❌ Error decoding F0 response: \(error.localizedDescription)")
              if let jsonString = String(data: data, encoding: .utf8) {
                  print("Received JSON: \(jsonString)") // Debugging: print the received JSON
              }
          }
      }
      task.resume()
  }


  
  
  var audioDuration: TimeInterval {
    audioPlayer?.duration ?? 0
  }
  
  func startAnimation(duration: TimeInterval) {
      // Prevent multiple animations
      guard animationTimer == nil else {
          print("🚨 Animation already running, skipping duplicate.")
          return
      }

      print("🎬 Starting animation for \(duration) seconds")

      animationProgress = 0.0 // Reset animation progress for new playback
      let timerInterval = 0.01
      let increment = timerInterval / duration

      animationTimer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
          if self.animationProgress < 1.0 {
              self.animationProgress += increment
          } else {
              self.animationProgress = 1.0
              timer.invalidate()
              self.animationTimer = nil // Reset timer
              print("✅ Animation completed")
          }
      }
  }
  
  func resetAnimation() {
      isPlaying = false
      if isPlayingSampleAudio {
          animationProgress = 0.0 // Reset animation progress for sample audio
      }
      print("end: \(animationProgress)")
  }
  
  func resetForNextWord() {
      collectedStars = 0 // Reset stars for the current word
      hasRecorded = false
      playingUserAudio = false
      pitchValues.removeAll()
      feedbackMessage = "" // Clear feedback for the next word
  }

  
  func calculateHighlightedStars(userPitchValues: [Double], correctValues: [Double]) -> Int {
    var count = 0
    for index in 0..<5 {
      let starIndex = (correctValues.count - 1) * index / 4
      if userPitchValues.indices.contains(starIndex) && abs(userPitchValues[starIndex] - correctValues[starIndex]) <= 15 {
        count += 1
      }
    }
    return count
  }
}

      
    
    
    
    
    extension WordAudioController {
      // MARK: AVAudioPlayerDelegate Method
      func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
          if flag {
              print("🔚 Audio finished playing")
              DispatchQueue.main.async {
                  self.status = .stopped
                  self.isPlaying = false
                  self.animationTimer = nil // Reset animation timer

                  // Reset the sample audio flag
                  self.isPlayingSampleAudio = false
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
  
