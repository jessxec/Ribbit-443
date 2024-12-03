//
//  WordViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

import Foundation
import AVFoundation

@MainActor
class WordViewModel: ObservableObject {
  private let moduleService: ModuleServiceProtocol
  @Published var words: [Word] = []
  @Published var currentWord: Word?
  @Published var isLoading = false
  @Published var errorMessage: String?
  @Published var currentIndex = 0
  @Published var lesson: Lesson?

  init(moduleService: ModuleServiceProtocol = ModuleService()) {
      self.moduleService = moduleService
  }

  // Update fetchWords in WordViewModel
  func fetchWords(forModuleId moduleId: String, lessonId: String) async {
      isLoading = true
      do {
          let module = try await moduleService.fetchModule(by: moduleId)
          if let lesson = module.lessons.first(where: { $0.id == lessonId }) {
              self.words = lesson.words
              self.currentIndex = 0
              self.currentWord = words.isEmpty ? nil : words[0]
              self.lesson = lesson // Store the lesson data, including content
              print("Fetched lesson content: \(lesson.content)")
              print("Fetched words: \(words.map { $0.word })")
          } else {
              errorMessage = "Lesson not found"
          }
      } catch {
          errorMessage = "Failed to fetch lesson: \(error.localizedDescription)"
          print(errorMessage ?? "Unknown error")
      }
      isLoading = false
  }


    // Advance to the next word in the lesson
    func nextWord() {
        print("Current index: \(currentIndex), words count: \(words.count)")
        guard currentIndex + 1 < words.count else { return }
        currentIndex += 1
        currentWord = words[currentIndex]
    }

}
