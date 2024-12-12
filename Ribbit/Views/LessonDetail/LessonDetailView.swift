//
//  LessonDetailView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI

struct LessonDetailView: View {
    let moduleId: String
    let lessonId: String // Add lessonId here
    let word: Word // The current word
    let lessonCount: Int // Total number of words in the lesson
    let currentIndex: Int // Current word index
    let nextWordAction: () -> Void // Callback for the next word action

    @StateObject private var audio: WordAudioController // StateObject for managing audio-related state
    @ObservedObject var viewModel: WordViewModel // ObservedObject for managing lesson data

    init(
        moduleId: String,
        lessonId: String, // Add this argument
        word: Word,
        lessonCount: Int,
        currentIndex: Int,
        nextWordAction: @escaping () -> Void,
        viewModel: WordViewModel
    ) {
        self.moduleId = moduleId
        self.lessonId = lessonId // Initialize this property
        self.word = word
        self.lessonCount = lessonCount
        self.currentIndex = currentIndex
        self.nextWordAction = nextWordAction
        self.viewModel = viewModel
        _audio = StateObject(wrappedValue: WordAudioController(word: word)) // Initialize audio controller
    }

    var body: some View {
        ZStack {
            VStack {
                // Top progress bar
                ProgressBarBackButton(currentPage: currentIndex + 1, totalPages: lessonCount)
                    .padding(.bottom, 10)

                Text("Word \(currentIndex + 1) of \(lessonCount)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)

                Spacer()

                ScrollView {
                    // Main content section
                    VStack(spacing: 20) {
                        Text("Stars Collected: \(audio.totalCollectedStars)")
                            .font(.headline)
                            .foregroundColor(Color(hex: "#917FA2"))

                        WordView(audio: audio, word: word)
                            .padding(.bottom, 20)

                        VisualizationView(
                            audio: audio,
                            word: word,
                            correctVector: word.samplePitchVectors,
                            userVector: audio.pitchValues,
                            module: moduleId
                        )
                        .padding(.bottom, 25)

                        // Actions section
                      ActionsView(audio: audio, viewModel: viewModel, word: word, moduleId: self.moduleId, lessonId: self.lessonId)
                            .padding(.bottom, 30)

                        if let feedbackMessage = audio.feedbackMessage, !feedbackMessage.isEmpty {
                            VStack(spacing: 10) {
                                Text("Feedback Message:")
                                    .font(.headline)
                                    .foregroundColor(Color(hex: "#554C5D"))

                                Text(feedbackMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .font(.caption) // Smaller font for clarity
                                    .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
                                    .background(Color(hex: "#917FA2"))
                                    .cornerRadius(8) // Rounded corners for a polished look
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide default navigation back button
    }
}
