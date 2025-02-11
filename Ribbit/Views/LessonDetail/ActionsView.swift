//
//  ActionsView.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/6/24.

import SwiftUI
import AVFoundation

struct ActionsView: View {
    @ObservedObject var audio: WordAudioController
    @ObservedObject var viewModel: WordViewModel

    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var finishedRecording = false
    @State private var showLessonComplete = false
    @State private var countdown = 0 // Countdown timer state
    @State private var isCountingDown = false // Controls countdown status

    let word: Word
    let moduleId: String // Module ID for the lesson
    let lessonId: String // Lesson ID
    @EnvironmentObject var badgeViewModel: BadgeViewModel // Access BadgeViewModel

    var body: some View {
        VStack(spacing: 20) {
            if isCountingDown {
                // Countdown Timer Display
                Text("\(countdown)")
                    .font(.largeTitle)
                    .foregroundColor(Color(hex: "3A8ACA"))
                    .fontWeight(.bold)
                    .scaleEffect(1.5)
                    .transition(.scale)
                    .padding(.bottom, 10)
            } else {
                Text(statusText)
                    .font(.body)
                    .foregroundColor(audio.status == .recording ? .red :
                                     (audio.status == .playing ? .blue : Color(hex: "#96C7C9")))
                    .padding(.bottom, 20)
            }

            HStack(spacing: 50) {
                if (finishedRecording || audio.hasRecorded) && audio.status != .playing {
                    // Playback Button
                    Button(action: handlePlayButton) {
                        Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color(hex: "#D2C0E2"))
                    }

                    // Retry Button
                    Button(action: {
                        finishedRecording = false
                        audio.totalCollectedStars -= audio.collectedStars
                        audio.resetForNextWord()
                    }) {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(hex: "#917FA2"))
                    }

                    if viewModel.currentIndex == viewModel.words.count - 1 {
                        // Complete Lesson Button
                        Button(action: {
                            showLessonComplete = true
                            Task {
                                if moduleId == "airportModule" && lessonId == "lesson3" {
                                    await badgeViewModel.unlockBadge(badgeId: "airport-navigator")
                                } else if moduleId == "foundationsIsland" && lessonId == "lesson4" {
                                    await badgeViewModel.unlockBadge(badgeId: "baby-steps")
                                }
                            }
                        }) {
                            Image(systemName: "pencil.and.outline")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(hex: "#917FA2"))
                        }
                        .fullScreenCover(isPresented: $showLessonComplete) {
                            NavigationStack {
                                LessonCompleteView(moduleId: moduleId, lessonId: lessonId)
                                    .environmentObject(badgeViewModel)
                            }
                        }
                    } else {
                        // Next Word Button
                        Button(action: handleNextButton) {
                            Image(systemName: "arrow.right.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(hex: "#D2C0E2"))
                        }
                    }
                } else {
                    // Record Button with Countdown
                  // Record Button with Countdown
                  Button(action: {
                      handleRecordButton()
                  }) {
                      Image(systemName: audio.status == .recording ? "stop.circle" : "mic.circle")
                          .resizable()
                          .frame(width: 60, height: 60)
                          .foregroundColor(isCountingDown ? .gray : Color(hex: "#917FA2"))
                  }
                  .disabled(isCountingDown) // Prevent pressing during countdown
                  }
                
            }
        }
    }

    private var statusText: String {
        if audio.status == .recordingStopped {
            return audio.hasRecorded ? "Playback your recording" : "Start recording"
        } else if audio.status == .recording {
            return "Recording..."
        } else if audio.status == .playing {
            return "Playing..."
        } else {
            return " "
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
            startCountdown()
        }
    }

  private func startCountdown() {
      countdown = 3
      isCountingDown = true

      Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
          DispatchQueue.main.async {
              if self.countdown > 1 {
                  self.countdown -= 1
              } else {
                  timer.invalidate()
                  self.isCountingDown = false
                  self.audio.startRecording(for: 5) { message in // Extend to 5 seconds
                      alertMessage = message
                      showAlert = true
                  }
              }
          }
      }
  }

    private func handleNextButton() {
        if viewModel.currentIndex + 1 < viewModel.words.count {
            viewModel.nextWord()
            audio.resetForNextWord()
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
