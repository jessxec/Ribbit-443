//
//  LessonDetailView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI

struct LessonDetailView: View {
    let word: Word // Accept a `Word` as a parameter
    let lessonCount: Int
    let currentIndex: Int
    let nextWordAction: () -> Void
    
  @StateObject var audio: WordAudioController
  
  init(word: Word, lessonCount: Int, currentIndex: Int, nextWordAction: @escaping () -> Void) {
          self.word = word
          self.lessonCount = lessonCount
          self.currentIndex = currentIndex
          self.nextWordAction = nextWordAction
          _audio = StateObject(wrappedValue: WordAudioController(word: word))
      }
  
    var body: some View {
        VStack {
            // Top progress bar
            ProgressBarBackButton(currentPage: currentIndex, totalPages: lessonCount)
                .padding(.top, 20) // Optional: add top padding for spacing
            
          Spacer()
          
          
            // Main content
            VStack() {
                WordView(audio: audio, word: word)
                .padding(.bottom, 40)
              
              VisualizationView(audio: audio, word: word, correctVector: word.samplePitchVectors, userVector: audio.pitchValues)
                .padding(.bottom, 40)
              
              ActionsView(audio: audio, word: word, nextWordAction: nextWordAction)
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
}

