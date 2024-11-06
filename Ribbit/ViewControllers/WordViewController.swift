//
//  WordViewController.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/2/24.
//

import AVFoundation
import Foundation
import SwiftUI

class WordViewController: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
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
  func playSampleWord(word: String) {
    guard let sampleURL = Bundle.main.url(forResource: "tone1", withExtension: "mp3")
    else {
      print("Audio file not found")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: sampleURL)
      audioPlayer?.delegate = self
      audioPlayer?.play()
      status = .playing
    } catch {
      print("Error playing audio: \(error.localizedDescription)")
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
         let fileSize = attributes[.size] as? UInt64 {
        if fileSize > 0 {
          
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            // Add code for what to do with the audio
            self.hasRecorded = true  // Set the flag to true when recording stops
          
            // async processing to determine if correct or incorrect
          }
        } else {
          print("Recorded file is empty.")
          completion("Error")
        }
      } else {
        print("Unable to retrieve file attributes.")
        completion("Error")
      }
    } else {
      print("Recorded file does not exist.")
      completion("Error")
    }
  }
  
  var audioDuration: TimeInterval {
    audioPlayer?.duration ?? 0
  }
  

}



extension WordViewController {

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
