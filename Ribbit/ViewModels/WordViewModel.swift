//
//  WordViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

//import Foundation
//import AVFoundation
//
//@MainActor
//class WordViewModel: ObservableObject {
//    private let moduleService: ModuleServiceProtocol
//    private let audioService: AudioServiceProtocol // Assuming AudioService handles playback
//    @Published var words: [Word] = []
//    @Published var currentWord: Word?
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//    @Published var isPlaying: Bool = false
//
//    init(moduleService: ModuleServiceProtocol = ModuleService(), audioService: AudioServiceProtocol = AudioService()) {
//        self.moduleService = moduleService
//        self.audioService = audioService
//    }
//
//    // Fetch words for a specific lesson
//    func fetchWords(forModuleId moduleId: String, lessonId: String) async {
//        isLoading = true
//        do {
//            let module = try await moduleService.fetchModule(by: moduleId)
//            if let lesson = module.lessons.first(where: { $0.id == lessonId }) {
//                words = lesson.words
//            }
//        } catch {
//            errorMessage = "Failed to fetch words: \(error.localizedDescription)"
//            print(errorMessage ?? "Unknown error")
//        }
//        isLoading = false
//    }
//
//    // Update word progress
//    func updateWordProgress(moduleId: String, lessonId: String, wordId: String, starsEarned: Int, transcriptionCheck: String?, voiceProcessingCheck: String?) async {
//        isLoading = true
//        do {
//            try await moduleService.updateWordProgress(
//                moduleId: moduleId,
//                lessonId: lessonId,
//                wordId: wordId,
//                transcriptionCheck: transcriptionCheck,
//                voiceProcessingCheck: voiceProcessingCheck,
//                starsEarned: starsEarned
//            )
//            if let wordIndex = words.firstIndex(where: { $0.id == wordId }) {
//                words[wordIndex].starValue = starsEarned
//            }
//        } catch {
//            errorMessage = "Failed to update word progress: \(error.localizedDescription)"
//            print(errorMessage ?? "Unknown error")
//        }
//        isLoading = false
//    }
//
//    // Play audio for a word using AudioService
//    func playWordAudio(for word: Word) {
//        do {
//            try audioService.playAudio(from: word.audioPath) // Assuming audioPath is a URL string
//            isPlaying = true
//        } catch {
//            errorMessage = "Failed to play audio: \(error.localizedDescription)"
//        }
//    }
//
//    func stopWordAudio() {
//        audioService.stopAudio()
//        isPlaying = false
//    }
//}

import Foundation
import AVFoundation

@MainActor
class WordViewModel: ObservableObject {
    private let moduleService: ModuleServiceProtocol
    @Published var words: [Word] = []
    @Published var currentWord: Word?
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var currentIndex = 0
    private var firebaseAudioController = FirebaseAudioController() // Using FirebaseAudioController for Firebase audio

    init(moduleService: ModuleServiceProtocol = ModuleService()) {
        self.moduleService = moduleService
    }

    // Fetch words for a specific lesson using the API
    func fetchWords(forModuleId moduleId: String, lessonId: String) async {
        isLoading = true
        do {
            let module = try await moduleService.fetchModule(by: moduleId)
            if let lesson = module.lessons.first(where: { $0.id == lessonId }) {
                self.words = lesson.words
                self.currentIndex = 0
                self.currentWord = words.isEmpty ? nil : words[0]
            }
        } catch {
            errorMessage = "Failed to fetch words: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }

    // Advance to the next word in the lesson
    func nextWord() {
        guard currentIndex + 1 < words.count else { return }
        currentIndex += 1
        currentWord = words[currentIndex]
    }

    // Play audio for the current word using Firebase
    func playCurrentWordAudio() {
        guard let word = currentWord else { return }
        firebaseAudioController.playFirebaseAudio(for: word.audioPath)
    }

    // Stop audio playback
    func stopCurrentWordAudio() {
        firebaseAudioController.stopPlayback()
    }
}
