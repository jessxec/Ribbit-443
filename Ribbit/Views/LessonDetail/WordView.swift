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
    
    let word: Word

    var body: some View {
      HStack {
        VStack {
          
          Text("\(word.pinyin)")
            .font(.system(size: 18))
            .foregroundColor(Color(hex: "#554C5D"))
          
          Text("\(word.word)")
            .font(.system(size: 64))
            .fontWeight(.medium)
            .foregroundColor(Color(hex: "#554C5D"))
          
          Text("\(word.translation)")
            .font(.system(size: 18))
            .fontWeight(.light)
            .foregroundColor(Color(hex: "#A0A0A0"))
        }
        .padding(.leading, 40)
        
        Button(action: togglePlayback) {
          Image(systemName: audio.status == .playing ? "stop.circle.fill" : "play.circle.fill")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(Color(hex: "#917FA2"))
        }
        .onChange(of: audio.status == .playing) { newValue in
          if !newValue {
            audio.resetAnimation()
          }
        }
      }
    }
    
    private func togglePlayback() {
        if audio.status == .playing {
            audio.stopPlayback()

        } else {
          audio.playSampleWord(for: word.audioPath)
        }
    }

}
