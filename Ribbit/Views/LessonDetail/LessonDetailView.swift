//
//  LessonDetailView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI

struct LessonDetailView: View {
    @State private var animationProgress: Double = 0
    let word: Word // Accept a `Word` as a parameter
    let lessonCount: Int
    let currentIndex: Int
    let nextWordAction: () -> Void
    
    var body: some View {
        VStack {
            // Top progress bar
            ProgressBarBackButton(currentPage: currentIndex, totalPages: lessonCount)
                .padding(.top, 20) // Optional: add top padding for spacing
            
          Spacer()
          
          
            // Main content
            VStack() {
                WordView(audio: WordAudioController(word: word), animationProgress: $animationProgress, word: word)
                .padding(.bottom, 40)
              
                VisualizationView(word: word, animationProgress: $animationProgress)
                .padding(.bottom, 40)
              
                ActionsView(audio: WordAudioController(word: word), word: word, nextWordAction: nextWordAction)
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
}

