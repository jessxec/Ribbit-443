//
//  File.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/5/24.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    var player: AVAudioPlayer?

    func playSound(forTone tone: Int) {
        let toneSound = "tone\(tone).mp3"
        print("Attempting to play sound: \(toneSound)")
        
        if let soundURL = Bundle.main.url(forResource: toneSound, withExtension: nil) {
            do {
                print("Playing sound: \(toneSound)")
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
            } catch {
                print("Error playing sound: \(error)")
            }
        } else {
            print("Sound not found for \(toneSound)")
        }
    }
}

