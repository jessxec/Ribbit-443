//
//  LessonsView.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

import SwiftUI

struct LessonView: View {
    @StateObject private var viewModel = WordViewModel()
    let moduleId: String
    let lessonId: String

    var body: some View {
        VStack {
            if let word = viewModel.currentWord {
              LessonDetailView(word: word, nextWordAction: viewModel.nextWord)
            } else {
                Text("Loading words...")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchWords(forModuleId: moduleId, lessonId: lessonId)
            }
        }
    }
}
