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
                QuestionView(word: word)
            } else {
                Text("Loading words...")
            }
            
            Button("Next Question") {
                viewModel.nextWord()
            }
            .padding()
        }
        .onAppear {
            Task {
                await viewModel.fetchWords(forModuleId: moduleId, lessonId: lessonId)
            }
        }
    }
}
