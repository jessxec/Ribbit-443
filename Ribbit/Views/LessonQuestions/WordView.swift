//
//  WordView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI
import AVFoundation

struct WordView: View {
    @ObservedObject var audio: WordViewController
    @State private var playbackPressed = false
    @Binding var animationProgress: Double
    
    let word: Word
    
    init(word: Word, animationProgress: Binding<Double>) {
        self.word = word
        self.audio = WordViewController(word: word)
        self._animationProgress = animationProgress
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("\(word.pinyin)")
                Text("\(word.word)")
                Text("\(word.translation)")
            }
            Button(action: {
                playbackPressed.toggle() // Toggle the playback state
                if playbackPressed {
                    audio.playWord(word: "\(word.word)")
                    startAnimation(duration: audio.audioDuration)
                } else {
                    audio.stopPlayback()
                    resetAnimation()
                }
            }) {
                Image(systemName: audio.isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40) // Optional: Change size of the image
                    .foregroundColor(audio.isPlaying ? .red : .blue) // Optional: Change color based on state
            }
            .onChange(of: audio.isPlaying) { newValue in // Listen for changes to isPlaying
              if !newValue {
                  playbackPressed = false // Reset button state when playback finishes
                  resetAnimation() // Reset the animation as well
              }
            }
        }
    }
    
    func startAnimation(duration: TimeInterval) {
        animationProgress = 0
        withAnimation(.linear(duration: duration)) {
            animationProgress = 1.0
        }
    }
    
    func resetAnimation() {
        animationProgress = 0
    }
}
