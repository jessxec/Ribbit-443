//
//  FirebaseUserServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/2/24.
//

import XCTest
import FirebaseCore
import FirebaseFirestore
@testable import Ribbit

@MainActor
class FirebaseUserServiceTests: XCTestCase {
    var viewModel: UserViewModel!
    var userService: UserService!

    override func setUp() {
        super.setUp()
        // Initialize Firebase only if it's not already initialized
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        userService = UserService()
        viewModel = UserViewModel(userService: userService)
    }

//    override func tearDown() {
//        super.tearDown()
//        // Optional: Clean up test data from Firebase
//        Task {
//            do {
//                try await userService.deleteUser(by: "testUserId") // Implement deleteUser in UserService
//            } catch {
//                print("Failed to delete test data:", error)
//            }
//        }
//    }

    func testFetchUserSuccess() async throws {
        // Create a test user in Firebase
        let testUserId = "testFetchUserId"
        let testUser = User(
            id: testUserId,
            name: "Firebase Test User",
            email: "firebase@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 0,
            badgesEarned: 0,
            modulesCompleted: 0,
            totalStarsCollected: 0,
            currentModule: "Intro",
            currentLesson: LessonProgress(lessonName: "Lesson 1", totalStarsCollected: 5, accuracy: 95, feedback: "Great start")
        )
        try await userService.createUser(testUser)

        // Fetch the user via the ViewModel
        await viewModel.fetchUser(id: testUserId)

        XCTAssertEqual(viewModel.user?.name, "Firebase Test User")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testCreateUserInFirebase() async throws {
        let newUser = User(
            id: "testFirebaseUserId",
            name: "Firebase Created User",
            email: "firebase.create@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 0,
            badgesEarned: 0,
            modulesCompleted: 0,
            totalStarsCollected: 0,
            currentModule: "Intro",
            currentLesson: LessonProgress(lessonName: "Lesson 1", totalStarsCollected: 5, accuracy: 95, feedback: "Great start")
        )

        try await userService.createUser(newUser)
        let fetchedUser = try await userService.fetchUser(by: "testFirebaseUserId")
        
        XCTAssertEqual(fetchedUser.name, newUser.name)
        XCTAssertEqual(fetchedUser.email, newUser.email)
    }
    
    func testUpdateUserProgressInFirebase() async throws {
        // Arrange: Create a user and add them to Firebase
        let userId = "testUpdateUserId"
        let initialUser = User(
            id: userId,
            name: "Update Test User",
            email: "firebase.update@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 0,
            badgesEarned: 0,
            modulesCompleted: 0,
            totalStarsCollected: 0,
            currentModule: "Intro",
            currentLesson: LessonProgress(lessonName: "Lesson 1", totalStarsCollected: 5, accuracy: 95, feedback: "Great start")
        )
        try await userService.createUser(initialUser)
        
        // Act: Update the user's lesson progress in Firebase
        let updatedLessonProgress = LessonProgress(lessonName: "Lesson 2", totalStarsCollected: 10, accuracy: 90, feedback: "Keep it up!")
        try await userService.updateUserProgress(userId: userId, progress: updatedLessonProgress)
        
        // Assert: Fetch the user again and verify that the lesson progress was updated
        let updatedUser = try await userService.fetchUser(by: userId)
        XCTAssertEqual(updatedUser.currentLesson.lessonName, updatedLessonProgress.lessonName)
        XCTAssertEqual(updatedUser.currentLesson.totalStarsCollected, updatedLessonProgress.totalStarsCollected)
        XCTAssertEqual(updatedUser.currentLesson.accuracy, updatedLessonProgress.accuracy)
        XCTAssertEqual(updatedUser.currentLesson.feedback, updatedLessonProgress.feedback)
    }
}
