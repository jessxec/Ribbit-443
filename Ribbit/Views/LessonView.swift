//
//  LessonsView.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

import SwiftUI
struct LessonView: View {
    @StateObject private var viewModel = WordViewModel()
    @State private var showPractice = false

    let moduleId: String
    let lessonId: String

    var body: some View {
        ZStack {
            if showPractice {
                if let word = viewModel.currentWord {
                    LessonDetailView(
                        word: word,
                        lessonCount: viewModel.words.count,
                        currentIndex: viewModel.currentIndex,
                        nextWordAction: viewModel.nextWord
                    )
                } else {
                    Text("Loading words...")
                }
            } else {
                if let content = viewModel.lesson?.content {
                    LessonContentView(
                        viewModel: viewModel, // Pass the viewModel here
                        startPracticeAction: { showPractice = true }, // Define the action
                        lessonId: lessonId,
                        showPractice: $showPractice // Pass the binding
                    )
                } else {
                    Text("Loading lesson content...")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "FFFAF3"))
        .ignoresSafeArea()
        .onAppear {
            Task {
                await viewModel.fetchWords(forModuleId: moduleId, lessonId: lessonId)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
