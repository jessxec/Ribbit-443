//
//  LessonViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/6/24.
//

import Foundation

@MainActor
class LessonViewModel: ObservableObject {
    private let moduleService: ModuleServiceProtocol
    @Published var lessons: [Lesson] = []
    @Published var selectedLesson: Lesson?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(moduleService: ModuleServiceProtocol = ModuleService()) {
        self.moduleService = moduleService
    }

    // Fetch lessons for a specific module
    func fetchLessons(forModuleId moduleId: String) async {
        isLoading = true
        do {
            let module = try await moduleService.fetchModule(by: moduleId)
            lessons = module.lessons
        } catch {
            errorMessage = "Failed to fetch lessons: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }
    
    // Update lesson progress for a specific lesson within a module
    func updateLessonProgress(moduleId: String, lessonId: String, starsCollected: Int) async {
        isLoading = true
        do {
            try await moduleService.updateLessonProgress(moduleId: moduleId, lessonId: lessonId, starsCollected: starsCollected)
            if let lessonIndex = lessons.firstIndex(where: { $0.id == lessonId }) {
              lessons[lessonIndex].totalStarsAvailable = starsCollected
            }
        } catch {
            errorMessage = "Failed to update lesson progress: \(error.localizedDescription)"
            print(errorMessage ?? "Unknown error")
        }
        isLoading = false
    }
}
