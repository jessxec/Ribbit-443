//
//  WordViewController.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/2/24.
//

import AVFoundation
import Foundation

class WordViewController: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    let word: Word

    @Published var isPlaying: Bool = false // Published property for the playback state

    init(word: Word) {
        self.word = word
        super.init() // Call the superclass initializer
        setupAudioPlayer() // Setup audio player
    }

    private func setupAudioPlayer() {
        // Construct the file URL for the audio file located in the sample folder
        guard let audioURL = Bundle.main.url(forResource: "tone1", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.delegate = self // Set the delegate
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error)")
        }
    }

    func playWord(word: String) {
        audioPlayer?.play()
        isPlaying = true // Update the playback state
    }

    func stopPlayback() {
        audioPlayer?.stop()
        isPlaying = false // Update the playback state
    }

    var audioDuration: TimeInterval {
        audioPlayer?.duration ?? 0
    }

    // MARK: - AVAudioPlayerDelegate Method
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Audio finished playing")
        DispatchQueue.main.async {
            self.isPlaying = false
          
          print("is playing \(self.isPlaying)")// Update the playback state
          
        }
    }
}
