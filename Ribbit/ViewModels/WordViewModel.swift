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
      defer { isLoading = false } // Ensure loading state is reset

      do {
          let module = try await moduleService.fetchModule(by: moduleId)
          if let lesson = module.lessons.first(where: { $0.id == lessonId }) {
              self.words = lesson.words
              self.lesson = lesson // Store the lesson data
              if !words.isEmpty {
                  self.currentIndex = 0
                  self.currentWord = words[0]
              } else {
                  self.currentWord = nil // No words available
                  print("Lesson has no words.")
              }
              print("Fetched lesson content: \(lesson.content)")
              print("Fetched words: \(words.map { $0.word })")
          } else {
              errorMessage = "Lesson not found"
              print("Lesson with ID \(lessonId) not found in module \(moduleId).")
          }
      } catch {
          errorMessage = "Failed to fetch lesson: \(error.localizedDescription)"
          print("Error fetching lesson: \(error.localizedDescription)")
      }
  }



    // Advance to the next word in the lesson
  func nextWord() {
      guard currentIndex + 1 < words.count else {
          print("No more words to display. Reached end of the lesson.")
          return
      }
      currentIndex += 1
      currentWord = words[currentIndex]
      print("Moved to next word. Current index: \(currentIndex), words count: \(words.count)")
  }

}
