//
//  QuestionView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI

struct QuestionView: View {
  @State private var animationProgress: Double = 0
  
    var body: some View {
      ZStack {
        // Background color layer
        Color(red: 255 / 255, green: 250 / 255, blue: 243 / 255)
            .ignoresSafeArea()
        // Main content
        VStack {
          HStack {
            WordView(word: Word(pinyin: "ni3 hao3", word: "你好", translation: "hello", audio: "ni3hao3"), animationProgress: $animationProgress)
          }.padding()
          VisualizationView(animationProgress: $animationProgress)
        }
      }
      
    }
}

#Preview {
    QuestionView()
}
