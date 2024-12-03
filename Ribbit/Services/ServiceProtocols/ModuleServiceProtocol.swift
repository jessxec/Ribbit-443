//
//  ModuleServiceProtocol.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/2/24.
//

import Foundation

protocol ModuleServiceProtocol {
    /// Fetches a module by its ID.
    func fetchModule(by id: String) async throws -> Module
  
    func fetchLesson(moduleId: String, lessonId: String) async throws -> Lesson

    /// Fetches all modules.
    func fetchAllModules() async throws -> [Module]

    /// Updates a module's unlock status and stars.
    func updateModuleUnlockStatus(moduleId: String, isUnlocked: Bool) async throws

    /// Updates lesson progress in a specific module.
    func updateLessonProgress(moduleId: String, lessonId: String, starsCollected: Int) async throws

    /// Updates word progress within a lesson, including transcription and voice processing check.
    func updateWordProgress(
        moduleId: String,
        lessonId: String,
        wordId: String,
        transcriptionCheck: String?,
        voiceProcessingCheck: String?,
        starsEarned: Int
    ) async throws

    /// Placeholder for sending audio to transcription and voice processing services
    func sendAudioForProcessing(audioData: Data) async throws -> (transcription: String, feedback: String)
  
    func updateUserPitchVectors(moduleId: String, lessonId: String, wordId: String, userPitchVectors: [Double]) async throws
}
