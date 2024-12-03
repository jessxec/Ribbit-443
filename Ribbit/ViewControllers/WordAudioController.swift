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
  
  var hasSentAPIRequest = false // Flag to prevent multiple API calls
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
        playingUserAudio = false
        startAnimation(duration: audioDuration)
        print(playingUserAudio)
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
      playingUserAudio = true
      startAnimation(duration: audioDuration)
      collectedStars = calculateHighlightedStars(userPitchValues: pitchValues, correctValues: word.samplePitchVectors)
    } catch {
      print("Error playing recorded audio: \(error.localizedDescription)")
    }
  }
  
  // MARK: play asset audio files
  func playAssetAudio(forTone tone: Int) {
    let toneSound = "tone\(tone).mp3"
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
  
  func startRecording(for duration: TimeInterval, completion: @escaping (String) -> Void) {
    setupRecorder()
    print("Self Pitch at Start Recording: \(self.pitchValues)")
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
      playRecording()
      
      guard FileManager.default.fileExists(atPath: urlForRecording.path) else {
          print("Recorded file does not exist.")
          return
      }
      
      let formantReferences = (F1: word.transcriptionCheck.F1, F2: word.transcriptionCheck.F2)
      
      // Call Formants API
      sendFormantsToAPI(referenceFormants: formantReferences) { [weak self] result in
          guard let self = self else { return }
          switch result {
          case .success(let response):
              DispatchQueue.main.async {
                  self.feedbackMessage = """
                  **Formant Feedback**
                  Feedback: \(response.feedback.joined(separator: "\n"))
                  Extracted F1: \(response.formants.F1), F2: \(response.formants.F2)
                  """
              }
          case .failure(let error):
              print("Formant API error: \(error.localizedDescription)")
              DispatchQueue.main.async {
                  self.feedbackMessage = "Formant analysis failed. Try again."
              }
          }
      }
      
      // Call Pitch API
      sendPitchToAPI(samplePitch: word.samplePitchVectors) { [weak self] result in
          guard let self = self else { return }
          switch result {
          case .success(let response):
              DispatchQueue.main.async {
                  // Update the pitch-related UI and graph data
                  self.pitchValues = response.pitch_values
                  self.feedbackMessage = (self.feedbackMessage ?? "") + """
                                  
                  **Pitch Feedback**
                  Average Feedback: \(response.feedback.average_feedback)
                  \(response.feedback.section_feedback.joined(separator: "\n"))
                  """

                  // Trigger graph update (assuming a method exists to update the graph)
//                  self.plotGraph(with: self.pitchValues)
              }
          case .failure(let error):
              print("Pitch API error: \(error.localizedDescription)")
              DispatchQueue.main.async {
                self.feedbackMessage = (self.feedbackMessage ?? "") + "\nPitch analysis failed. Try again."
              }
          }
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
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"audio\"; filename=\"\(urlForRecording.lastPathComponent)\"\r\n".data(using: .utf8)!)
      data.append("Content-Type: audio/wav\r\n\r\n".data(using: .utf8)!)
      data.append(try! Data(contentsOf: urlForRecording))
      data.append("\r\n".data(using: .utf8)!)
      
      let samplePitchString = samplePitch.map { "\($0)" }.joined(separator: ",")
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"sample_pitch\"\r\n\r\n".data(using: .utf8)!)
      data.append("[\(samplePitchString)]".data(using: .utf8)!)
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
              let decoder = JSONDecoder()
              let response = try decoder.decode(PitchResponse.self, from: data)
              completion(.success(response))
          } catch {
              completion(.failure(error))
          }
      }
      task.resume()
  }
  
  
  func sendFormantsToAPI(referenceFormants: (F1: Double, F2: Double), completion: @escaping (Result<FormantsResponse, Error>) -> Void) {
      let url = URL(string: "https://jacksun815.pythonanywhere.com/check_formants")!
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
      
      let referenceFormantsJSON = """
      {"F1": \(referenceFormants.F1), "F2": \(referenceFormants.F2)}
      """
      data.append("--\(boundary)\r\n".data(using: .utf8)!)
      data.append("Content-Disposition: form-data; name=\"reference_formants\"\r\n\r\n".data(using: .utf8)!)
      data.append(referenceFormantsJSON.data(using: .utf8)!)
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
              let decoder = JSONDecoder()
              let response = try decoder.decode(FormantsResponse.self, from: data)
              completion(.success(response))
          } catch {
              completion(.failure(error))
          }
      }
      task.resume()
  }

  
  
  var audioDuration: TimeInterval {
    audioPlayer?.duration ?? 0
  }
  
  func startAnimation(duration: TimeInterval) {
    // Reset progress
    animationProgress = 0.0
    
    // Timer interval to increment progress
    let timerInterval = 0.01
    let increment = timerInterval / duration
    
    Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
      if self.animationProgress < 1.0 {
        self.animationProgress += increment
      } else {
        self.animationProgress = 1.0
        timer.invalidate() // Stop the timer when done
      }
    }
  }
  
  func resetAnimation() {
    animationProgress = 0.0
    print("end: \(animationProgress)")
  }
  
  func resetForNextWord() {
    feedbackMessage = ""
    totalCollectedStars += collectedStars
    collectedStars = 0
    hasRecorded = false
    playingUserAudio = false
    pitchValues.removeAll()
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
  

