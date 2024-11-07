//
//  WordView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//


import SwiftUI
import AVFoundation

struct WordView: View {
    @ObservedObject var audio: WordAudioController
    @Binding var animationProgress: Double
    
    let word: Word

    var body: some View {
        HStack {
            VStack {
                Text("\(word.pinyin)")
                Text("\(word.word)")
                Text("\(word.translation)")
            }
            Button(action: togglePlayback) {
                Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(audio.status == .playing ? .green : .blue)
            }
            .onChange(of: audio.status == .playing) { newValue in
                if !newValue {
                    resetAnimation()
                }
            }
        }
    }
    
    private func togglePlayback() {
        if audio.status == .playing {
            audio.stopPlayback()
            resetAnimation()
        } else {
          audio.playSampleWord(for: word.audioPath)
            startAnimation(duration: audio.audioDuration)
        }
    }

    private func startAnimation(duration: TimeInterval) {
        animationProgress = 0
        withAnimation(.easeInOut(duration: duration)) {
            animationProgress = 1.0
        }
    }

    private func resetAnimation() {
        animationProgress = 0
    }
}
