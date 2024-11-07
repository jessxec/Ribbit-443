//
//  WordView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

//import SwiftUI
//import AVFoundation
//
//struct WordView: View {
//    @ObservedObject var audio: WordViewController
//    @State private var playbackPressed = false
//    @Binding var animationProgress: Double
//    
//    let word: Word
//    
//    init(word: Word, animationProgress: Binding<Double>) {
//        self.word = word
//        self.audio = WordViewController(word: word)
//        self._animationProgress = animationProgress
//    }
//    
//    var body: some View {
//        HStack {
//            VStack {
//                Text("\(word.pinyin)")
//                Text("\(word.word)")
//                Text("\(word.translation)")
//            }
//            Button(action: {
//                playbackPressed.toggle() // Toggle the playback state
//                if playbackPressed {
//                    audio.playSampleWord(word: "\(word.word)")
//                  startAnimation(duration: audio.audioDuration)
//                } else {
//                    audio.stopPlayback()
//                    resetAnimation()
//                }
//            }) {
//              Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
//                    .resizable()
//                    .frame(width: 40, height: 40) // Optional: Change size of the image
//                    .foregroundColor(audio.status == .playing ? .red : .blue) // Optional: Change color based on state
//            }
//            .onChange(of: audio.status) { newValue  in // Listen for changes to isPlaying
//              if newValue == .stopped {
//                  playbackPressed = false // Reset button state when playback finishes
//                  resetAnimation() // Reset the animation as well
//              }
//            }
//        }
//    }
//    
//    func startAnimation(duration: TimeInterval) {
//        animationProgress = 0
//        withAnimation(.linear(duration: duration)) {
//            animationProgress = 1.0
//        }
//    }
//    
//    func resetAnimation() {
//        animationProgress = 0
//    }
//}


import SwiftUI
import AVFoundation

struct WordView: View {
    @ObservedObject var audio: WordViewController
    @StateObject private var firebaseAudioController = FirebaseAudioController()
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
                    firebaseAudioController.playFirebaseAudio(for: word.audioPath) // Play word audio
                    startAnimation(duration: audio.audioDuration) // Adjust the duration if necessary
                } else {
                    firebaseAudioController.stopPlayback()
                    resetAnimation()
                }
            }) {
                Image(systemName: firebaseAudioController.isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40) // Larger for word audio
                    .foregroundColor(firebaseAudioController.isPlaying ? .green : .blue)
            }
            .onChange(of: firebaseAudioController.isPlaying) { newValue in
                if !newValue {
                    playbackPressed = false
                    resetAnimation()
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
