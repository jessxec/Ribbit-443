//
//  FirebaseAudioController.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//
//
//import FirebaseStorage
//import AVFoundation
//
//extension WordViewController {
//    
//    func fetchAudioFromFirebase(for word: String, completion: @escaping (URL?) -> Void) {
//        // Updated path to include 'foundations' subdirectory
//        let storageRef = Storage.storage().reference().child("audio/foundations/\(word).mp3")
//        
//        storageRef.downloadURL { url, error in
//            if let error = error {
//                print("Error fetching audio from Firebase: \(error.localizedDescription)")
//                completion(nil)
//            } else {
//                completion(url)
//            }
//        }
//    }
//    
//    func playFirebaseAudio(for word: String) {
//        fetchAudioFromFirebase(for: word) { [weak self] url in
//            guard let self = self, let url = url else { return }
//            
//            do {
//                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
//                self.audioPlayer?.delegate = self
//                self.audioPlayer?.play()
//                self.status = .playing
//            } catch {
//                print("Error playing Firebase audio: \(error.localizedDescription)")
//            }
//        }
//    }
//}


//import Foundation
//import FirebaseStorage
//import AVFoundation
//
//class FirebaseAudioController: NSObject, ObservableObject {
//    private var audioPlayer: AVPlayer?
//    @Published var status: AudioStatus = .stopped
//    
//    func fetchAudioFromFirebase(for word: String, completion: @escaping (URL?) -> Void) {
//        let storageRef = Storage.storage().reference().child("audio/foundations/\(word).mp3")
//        
//        storageRef.downloadURL { url, error in
//            if let error = error {
//                print("Error fetching audio from Firebase: \(error.localizedDescription)")
//                completion(nil)
//            } else {
//                completion(url)
//            }
//        }
//    }
//    
//    func playFirebaseAudio(for word: String) {
//        fetchAudioFromFirebase(for: word) { [weak self] url in
//            guard let self = self, let url = url else {
//                print("Invalid URL or self is nil.")
//                return
//            }
//            
//            // Initialize AVPlayer for streaming
//            self.audioPlayer = AVPlayer(url: url)
//            self.audioPlayer?.play()
//            self.status = .playing
//        }
//    }
//    
//    func stopPlayback() {
//        audioPlayer?.pause()
//        status = .stopped
//    }
//}


import Foundation
import AVFoundation
import FirebaseStorage

class FirebaseAudioController: ObservableObject {
    @Published var isPlaying: Bool = false
    private var audioPlayer: AVPlayer?

    func playFirebaseAudio(for audioPath: String) {
        let storageRef = Storage.storage().reference().child("\(audioPath)")

        storageRef.downloadURL { [weak self] url, error in
            guard let self = self, let url = url, error == nil else {
                print("Error fetching audio URL from Firebase: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.audioPlayer = AVPlayer(url: url)
            self.audioPlayer?.play()
            self.isPlaying = true
            
            // Observe when playback finishes to update isPlaying
            NotificationCenter.default.addObserver(self, selector: #selector(self.audioDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: self.audioPlayer?.currentItem)
        }
    }

    func stopPlayback() {
        audioPlayer?.pause()
        isPlaying = false
    }

    @objc private func audioDidFinishPlaying() {
        isPlaying = false
    }
}
