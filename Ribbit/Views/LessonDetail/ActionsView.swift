//
//  ActionsView.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/6/24.
//

import SwiftUI
import AVFoundation

struct ActionsView: View {
  @ObservedObject var audio: WordAudioController
  
  @State private var alertMessage = ""
  @State private var showAlert = false
  @State private var finishedRecording = false
  
  let word: Word
  let nextWordAction: () -> Void
  
  var body: some View {
    VStack(spacing: 20) {
      
      // Display current status
      Text("\(statusText)")
        .font(.body)
        .foregroundColor(Color(hex: "#96C7C9"))
        .padding(.bottom, 20)
      
      HStack(spacing: 50) {
        // Display retry, playback, next button
        if (finishedRecording || audio.hasRecorded) && audio.status != .playing {
          // retry button
          Button(action: {
            finishedRecording = false
            audio.hasRecorded = false
          }) {
            Image(systemName: "arrow.2.circlepath.circle")
              .resizable()
              .frame(width: 40, height: 40)
              .foregroundColor(Color(hex: "#D2C0E2"))
          }
          
          // playback Button
          Button(action: {
            handlePlayButton()
          }) {
            Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
              .resizable()
              .frame(width: 60, height: 60)
              .foregroundColor(Color(hex: "#917FA2"))
          }
          
          // next Button switch to next word question
          Button(action: {
            print("Next Word")
            nextWordAction()
          }) {
            Image(systemName: "arrow.right.circle")
              .resizable()
              .frame(width: 40, height: 40)
              .foregroundColor(Color(hex: "#D2C0E2"))
          }
        } else if (finishedRecording || audio.hasRecorded) && audio.status == .playing {
            // do nothing
        } else {
          Button(action: {
            handleRecordButton()
          }) {
            Image(systemName: audio.status == .recording ? "stop.circle" : "mic.circle")
              .resizable()
              .frame(width: 60, height: 60)
              .foregroundColor(Color(hex: "#917FA2"))
          }
        }
      }
    }
  }
    
    // MARK: - Helpers
    
    private var statusText: String {
      if audio.status == .recordingStopped {
        if audio.hasRecorded {
          return "Playback your recording"
        } else {
          return "Start recording"
        }
      } else if audio.status == .recording {
          return "Recording..."
      } else if audio.status == .playing {
        return "Playing..."
      } else {
        return ""
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


