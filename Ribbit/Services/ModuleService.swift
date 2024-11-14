//
//  ModuleService.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/4/24.
//

import Foundation
import FirebaseFirestore

class ModuleService: ModuleServiceProtocol {
    private let db = Firestore.firestore()

    func fetchModule(by id: String) async throws -> Module {
        let moduleDoc = db.collection("Modules").document(id)
        let snapshot = try await moduleDoc.getDocument()
        guard let module = try? snapshot.data(as: Module.self) else {
            throw NSError(domain: "ModuleService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Module not found"])
        }
        return module
    }

    func fetchAllModules() async throws -> [Module] {
        let modulesSnapshot = try await db.collection("Modules").getDocuments()
        return modulesSnapshot.documents.compactMap { try? $0.data(as: Module.self) }
    }

    func updateModuleUnlockStatus(moduleId: String, isUnlocked: Bool) async throws {
        let moduleDoc = db.collection("Modules").document(moduleId)
        try await moduleDoc.updateData(["isUnlocked": isUnlocked])
    }

    // Adjusted updateLessonProgress for embedded lessons array
    func updateLessonProgress(moduleId: String, lessonId: String, starsCollected: Int) async throws {
        let moduleDoc = db.collection("Modules").document(moduleId)
        let moduleSnapshot = try await moduleDoc.getDocument()

        guard var moduleData = moduleSnapshot.data(),
              var lessons = moduleData["lessons"] as? [[String: Any]],
              let lessonIndex = lessons.firstIndex(where: { $0["id"] as? String == lessonId }) else {
            throw NSError(domain: "ModuleService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Lesson not found"])
        }

        lessons[lessonIndex]["totalStarsAvailable"] = starsCollected
        moduleData["lessons"] = lessons

        try await moduleDoc.setData(moduleData, merge: true)
    }

    // Adjusted updateWordProgress for embedded words array
    func updateWordProgress(
        moduleId: String,
        lessonId: String,
        wordId: String,
        transcriptionCheck: String?,
        voiceProcessingCheck: String?,
        starsEarned: Int
    ) async throws {
        let moduleDoc = db.collection("Modules").document(moduleId)
        let moduleSnapshot = try await moduleDoc.getDocument()

        guard var moduleData = moduleSnapshot.data(),
              var lessons = moduleData["lessons"] as? [[String: Any]],
              let lessonIndex = lessons.firstIndex(where: { $0["id"] as? String == lessonId }),
              var words = lessons[lessonIndex]["words"] as? [[String: Any]],
              let wordIndex = words.firstIndex(where: { $0["id"] as? String == wordId }) else {
            throw NSError(domain: "ModuleService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Word not found"])
        }

        words[wordIndex]["transcriptionCheck"] = transcriptionCheck
        words[wordIndex]["voiceProcessingCheck"] = voiceProcessingCheck
        words[wordIndex]["starsEarned"] = starsEarned
        lessons[lessonIndex]["words"] = words
        moduleData["lessons"] = lessons

        try await moduleDoc.setData(moduleData, merge: true)
    }

    func sendAudioForProcessing(audioData: Data) async throws -> (transcription: String, feedback: String) {
        // Placeholder function for integration with transcription and voice processing services
        // This would normally send the audio data to an external service and return the results
        return ("transcribed text", "feedback message")
    }
  
    func updateUserPitchVectors(moduleId: String, lessonId: String, wordId: String, userPitchVectors: [Double]) async throws {
        let moduleDoc = db.collection("Modules").document(moduleId)
        let moduleSnapshot = try await moduleDoc.getDocument()
        
        guard var moduleData = moduleSnapshot.data(),
              var lessons = moduleData["lessons"] as? [[String: Any]],
              let lessonIndex = lessons.firstIndex(where: { $0["id"] as? String == lessonId }),
              var words = lessons[lessonIndex]["words"] as? [[String: Any]],
              let wordIndex = words.firstIndex(where: { $0["id"] as? String == wordId }) else {
            throw NSError(domain: "ModuleService", code: 404, userInfo: [NSLocalizedDescriptionKey: "Word not found"])
        }
        
        words[wordIndex]["userPitchVectors"] = userPitchVectors
        lessons[lessonIndex]["words"] = words
        moduleData["lessons"] = lessons
        
        try await moduleDoc.setData(moduleData, merge: true)
    }
}
