//
//  LessonDetailView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//
import SwiftUI

struct LessonDetailView: View {
    let moduleId: String
    let word: Word // Accept a `Word` as a parameter
    let lessonCount: Int
    let currentIndex: Int
    let nextWordAction: () -> Void

    @StateObject var audio: WordAudioController
    @ObservedObject var viewModel: WordViewModel // Add this

    init(
        moduleId: String,
        word: Word,
        lessonCount: Int,
        currentIndex: Int,
        nextWordAction: @escaping () -> Void,
        viewModel: WordViewModel // Pass viewModel
    ) {
        self.moduleId = moduleId
        self.word = word
        self.lessonCount = lessonCount
        self.currentIndex = currentIndex
        self.nextWordAction = nextWordAction
        self.viewModel = viewModel // Initialize viewModel
        _audio = StateObject(wrappedValue: WordAudioController(word: word))
    }

    var body: some View {
        ZStack {
            VStack {
                // Top progress bar
                ProgressBarBackButton(currentPage: currentIndex, totalPages: lessonCount - 1)
                Text("Word \(currentIndex + 1) / \(lessonCount)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                Spacer()

                ScrollView {
                    // Main content
                    VStack {
                        Text("Stars: \(audio.totalCollectedStars)")
                        WordView(audio: audio, word: word)
                            .padding(.bottom, 40)

                      VisualizationView(audio: audio, word: word, correctVector: word.samplePitchVectors, userVector: audio.pitchValues, module: moduleId)
                            .padding(.bottom, 25)

                        // Updated ActionsView call
                        ActionsView(audio: audio, viewModel: viewModel, word: word)
                            .padding(.bottom, 30)

                        if let feedbackMessage = audio.feedbackMessage, !feedbackMessage.isEmpty {
                            Text("Feedback Message: ")
                                .padding()
                                .font(.headline)
                            Text(feedbackMessage)
                                .padding()
                                .foregroundColor(.white)
                                .font(.caption) // Smaller font
                                .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
                                .background(Color(hex: "#917FA2"))
                                .cornerRadius(8) // Optional: Add rounded corners for a polished look
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding()

                    Spacer()
                }
            }
        }
    }
}
