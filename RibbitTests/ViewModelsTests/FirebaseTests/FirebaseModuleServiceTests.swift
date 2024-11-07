//
//  FirebaseModuleServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/4/24.
//

import XCTest
import FirebaseFirestore
@testable import Ribbit

class FirebaseModuleServiceTests: XCTestCase {
    private let db = Firestore.firestore()
    private var moduleService: ModuleService!

    override func setUp() async throws {
        try await super.setUp()
        moduleService = ModuleService()
    }

    override func tearDown() async throws {
        try await deleteTestModules()
        moduleService = nil
        try await super.tearDown()
    }

    // Helper function to create a test module in Firebase
    private func createTestModule(module: Module) async throws {
        let moduleData = try Firestore.Encoder().encode(module)
        try await db.collection("Modules").document(module.id!).setData(moduleData)
    }

    // Helper function to delete test modules after each test
    private func deleteTestModules() async throws {
        let modulesCollection = db.collection("Modules")
        let snapshot = try await modulesCollection.getDocuments()
        for document in snapshot.documents {
            if document.documentID.starts(with: "testModule") {
                try await modulesCollection.document(document.documentID).delete()
            }
        }
    }

    // Test case for fetching a module by ID
    func testFetchModule() async throws {
        // Arrange
        let testModuleId = "testModuleFetch"
        let testModule = Module(
            id: testModuleId,
            title: "Tones | Test",
            starsRequired: 5,
            isUnlocked: true,
            totalStarsAvailable: 50,
            lessons: []
        )

        // Act
        try await createTestModule(module: testModule)
        let fetchedModule = try await moduleService.fetchModule(by: testModuleId)

        // Assert
        XCTAssertEqual(fetchedModule.id, testModule.id)
        XCTAssertEqual(fetchedModule.title, "Tones | Test")
        XCTAssertTrue(fetchedModule.isUnlocked)
    }

    // Test case for fetching all modules
    func testFetchAllModules() async throws {
        // Arrange
        let testModuleId1 = "testModuleAll1"
        let testModuleId2 = "testModuleAll2"
        let testModule1 = Module(id: testModuleId1, title: "Module 1", starsRequired: 5, isUnlocked: true, totalStarsAvailable: 20, lessons: [])
        let testModule2 = Module(id: testModuleId2, title: "Module 2", starsRequired: 10, isUnlocked: false, totalStarsAvailable: 40, lessons: [])

        // Act
        try await createTestModule(module: testModule1)
        try await createTestModule(module: testModule2)
        let allModules = try await moduleService.fetchAllModules()

        // Assert
        XCTAssertTrue(allModules.contains { $0.id == testModuleId1 })
        XCTAssertTrue(allModules.contains { $0.id == testModuleId2 })
    }

    // Test case for updating module unlock status
    func testUpdateModuleUnlockStatus() async throws {
        // Arrange
        let testModuleId = "testModuleUnlock"
        let testModule = Module(
            id: testModuleId,
            title: "Unlock Test Module",
            starsRequired: 5,
            isUnlocked: false,
            totalStarsAvailable: 25,
            lessons: []
        )

        // Act
        try await createTestModule(module: testModule)
        try await moduleService.updateModuleUnlockStatus(moduleId: testModuleId, isUnlocked: true)
        let updatedModule = try await moduleService.fetchModule(by: testModuleId)

        // Assert
        XCTAssertTrue(updatedModule.isUnlocked)
    }

    // Test case for updating lesson progress
    func testUpdateLessonProgress() async throws {
        // Arrange
        let testModuleId = "testModuleLesson"
        let testLessonId = "lesson1"
        let testModule = Module(
            id: testModuleId,
            title: "Lesson Progress Module",
            starsRequired: 5,
            isUnlocked: true,
            totalStarsAvailable: 50,
            lessons: [
                Lesson(id: testLessonId, title: "Lesson 1", lessonOrder: 1, totalStarsAvailable: 25, words: [])
            ]
        )

        // Act
        try await createTestModule(module: testModule)
        try await moduleService.updateLessonProgress(moduleId: testModuleId, lessonId: testLessonId, starsCollected: 20)
        let fetchedModule = try await moduleService.fetchModule(by: testModuleId)

        // Assert
        XCTAssertEqual(fetchedModule.lessons.first?.totalStarsAvailable, 20)
    }

    // Existing test for updating word progress within a lesson
    func testUpdateWordProgress() async throws {
        // Arrange
        let testModuleId = "testModuleWord"
        let testLessonId = "lesson1"
        let testWordId = "word1"
        let testModule = Module(
            id: testModuleId,
            title: "Word Progress Module",
            starsRequired: 10,
            isUnlocked: true,
            totalStarsAvailable: 100,
            lessons: [
                Lesson(id: testLessonId, title: "Lesson 1", lessonOrder: 1, totalStarsAvailable: 50, words: [
                    Word(
                        id: testWordId,
                        pinyin: "mā",
                        word: "妈",
                        translation: "mom",
                        audioPath: "/audio/tones/mom.mp3",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(incorrectPitch: "Try to keep an even pitch.", incorrectPronunciation: "Emphasize the start."),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [120.0, 130.5, 125.4],
                        userPitchVectors: []
                    )
                ])
            ]
        )

        // Act
        try await createTestModule(module: testModule)
        try await moduleService.updateWordProgress(
            moduleId: testModuleId,
            lessonId: testLessonId,
            wordId: testWordId,
            transcriptionCheck: "妈",
            voiceProcessingCheck: "Correct",
            starsEarned: 5
        )
        let fetchedModule = try await moduleService.fetchModule(by: testModuleId)
        let updatedWord = fetchedModule.lessons.first?.words.first

        // Assert
        XCTAssertEqual(updatedWord?.transcriptionCheck, "妈")
        XCTAssertEqual(updatedWord?.voiceProcessingCheck, "Correct")
        XCTAssertEqual(updatedWord?.starValue, 5)
    }

    // New test for updating userPitchVectors
    func testUpdateUserPitchVectors() async throws {
        // Arrange
        let testModuleId = "testModuleUserPitch"
        let testLessonId = "lesson2"
        let testWordId = "word2"
        let testModule = Module(
            id: testModuleId,
            title: "Pitch Vectors Test Module",
            starsRequired: 10,
            isUnlocked: true,
            totalStarsAvailable: 100,
            lessons: [
                Lesson(id: testLessonId, title: "Lesson 2", lessonOrder: 2, totalStarsAvailable: 50, words: [
                    Word(
                        id: testWordId,
                        pinyin: "bā",
                        word: "爸",
                        translation: "dad",
                        audioPath: "/audio/tones/dad.mp3",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(incorrectPitch: "Try to keep an even pitch.", incorrectPronunciation: "Emphasize the start."),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [110.0, 115.5, 117.4],
                        userPitchVectors: []
                    )
                ])
            ]
        )

        // Act
        try await createTestModule(module: testModule)
        let newUserPitchVectors: [Double] = [111.0, 118.5, 120.4]
        try await moduleService.updateUserPitchVectors(
            moduleId: testModuleId,
            lessonId: testLessonId,
            wordId: testWordId,
            userPitchVectors: newUserPitchVectors
        )
        let fetchedModule = try await moduleService.fetchModule(by: testModuleId)
        let updatedWord = fetchedModule.lessons.first?.words.first

        // Assert
        XCTAssertEqual(updatedWord?.userPitchVectors, newUserPitchVectors)
        XCTAssertEqual(updatedWord?.samplePitchVectors, [110.0, 115.5, 117.4]) // samplePitchVectors should remain unchanged
    }

    // Test case for placeholder audio processing
    func testSendAudioForProcessing() async throws {
        // Arrange
        let audioData = Data() // Replace with actual audio data in a real scenario

        // Act
        let (transcription, feedback) = try await moduleService.sendAudioForProcessing(audioData: audioData)

        // Assert
        XCTAssertEqual(transcription, "transcribed text")
        XCTAssertEqual(feedback, "feedback message")
    }
  
  
}
