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
    let nextWordAction: () -> Void
    
    var body: some View {
        ZStack {
            // Background color layer
              Color(red: 255 / 255, green: 250 / 255, blue: 243 / 255)
                .ignoresSafeArea()
            
            // Main content
            VStack {
                HStack {
                  WordView(audio: WordAudioController(word: word), animationProgress: $animationProgress, word: word)
                }.padding()
              VisualizationView(word: word, animationProgress: $animationProgress)
              ActionsView(audio: WordAudioController(word: word), word: word, nextWordAction: nextWordAction) // Pass the current word to ActionsView
            }
        }
    }
}
