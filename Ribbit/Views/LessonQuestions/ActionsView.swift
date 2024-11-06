//
//  ActionsView.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/6/24.
//

import SwiftUI
import AVFoundation

struct ActionsView: View {
  @ObservedObject var audio: WordViewController
  @State private var alertMessage = ""
  @State private var showAlert = false
  @State private var finishedRecording = false
  
  let word: Word
  
  init(word: Word) {
      self.word = word
      self.audio = WordViewController(word: word)
  }
  
  var body: some View {
    VStack(spacing: 20) {
      
      // Display current status
      Text("Status: \(statusText)")
        .font(.body)
        .foregroundColor(statusColor)
      
      HStack {
        // Display retry, playback, next button
        if finishedRecording || audio.hasRecorded {
          // retry button
          Button(action: {
            finishedRecording = false
            audio.hasRecorded = false
          }) {
            Image(systemName: "arrow.2.circlepath.circle")
          }
          
          // playback Button
          Button(action: {
            handlePlayButton()
          }) {
            Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
          }
          
          // next Button switch to next word question
          Button(action: {
            print("next word")
          }) {
            Image(systemName: "arrow.right.circle")
          }
        } else {
          Button(action: {
            handleRecordButton()
          }) {
            Image(systemName: audio.status == .recording ? "stop.circle" : "mic.circle")
          }
        }
      }
    }
  }
    
    // MARK: - Helpers
    
    private var statusText: String {
      if audio.status == .recordingStopped {
        if audio.hasRecorded {
          return "Playback your Recording"
        } else {
          return "Start Recording"
        }
      } else if audio.status == .recording {
          return "Recording..."
      } else if audio.status == .playing {
        return "Playing..."
      } else {
        return ""
      }
    }
    
    private var statusColor: Color {
        switch audio.status {
        case .recordingStopped: return .blue
        case .recording: return .red
        case .playing: return .green
        case .stopped: return .primary
        }
    }
    
    private func handleRecordButton() {
      if audio.status == .recording {
        audio.stopRecording { message in
          alertMessage = message
          showAlert = true
          finishedRecording = true
        }
      } else {
        audio.startRecording(for: 2) { message in
          alertMessage = message
          showAlert = true
        }
      }
    }
    
    private func handlePlayButton() {
        if audio.status == .playing {
            audio.stopPlayback()
        } else {
          audio.playRecording()
        }
    }
}

// MARK: - Preview

struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
      ActionsView(word: Word(pinyin: "ni3 hao3", word: "你好", translation: "hello", audio: "ni3hao3"))
    }
}
