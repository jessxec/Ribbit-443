//
//  MockUserServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import FirebaseFirestore
import XCTest
@testable import Ribbit

//class UserViewModelTests: XCTestCase {
//    var viewModel: UserViewModel!
//    var mockUserService: MockUserService!
//
//    override func setUp() {
//        super.setUp()
//        mockUserService = MockUserService()
//        viewModel = UserViewModel(userService: mockUserService)
//    }
//
//    func testFetchUserSuccess() {
//        let expectation = XCTestExpectation(description: "Fetch user successfully")
//
//        mockUserService.shouldReturnError = false
//        viewModel.fetchUser(id: "test-id")
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            XCTAssertEqual(self.viewModel.user?.name, "Test User")
//            XCTAssertFalse(self.viewModel.isLoading)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 1.0)
//    }
//
//    func testFetchUserFailure() {
//        let expectation = XCTestExpectation(description: "Fail to fetch user")
//
//        mockUserService.shouldReturnError = true
//        viewModel.fetchUser(id: "test-id")
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            XCTAssertNil(self.viewModel.user)
//            XCTAssertFalse(self.viewModel.isLoading)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 1.0)
//    }
//}

@MainActor
class MockUserServiceTests: XCTestCase {
    var viewModel: UserViewModel!
    var mockUserService: MockUserService!
//    var userService: UserService!

    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        viewModel = UserViewModel(userService: mockUserService)
//        userService = UserService() // Initialize userService here
    }

    func testFetchUserSuccess() async throws {
        mockUserService.shouldReturnError = false
        await viewModel.fetchUser(id: "test-id")
        
        XCTAssertEqual(viewModel.user?.name, "Test User")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchUserFailure() async throws {
        mockUserService.shouldReturnError = true
        await viewModel.fetchUser(id: "test-id")
        
        XCTAssertNil(viewModel.user)
        XCTAssertFalse(viewModel.isLoading)
    }
  
    func testCreateUser() async throws {
        let newUser = User(
            id: "testUserId",
            name: "Test User",
            email: "test@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 0,
            badgesEarned: 0,
            modulesCompleted: 0,
            totalStarsCollected: 0,
            currentModule: "Intro",
            currentLesson: LessonProgress(lessonName: "Lesson 1", totalStarsCollected: 5, accuracy: 95, feedback: "Great start")
        )

        do {
            try await mockUserService.createUser(newUser)
            let fetchedUser = try await mockUserService.fetchUser(by: "testUserId2")
            
            XCTAssertEqual(fetchedUser.name, newUser.name)
            XCTAssertEqual(fetchedUser.email, newUser.email)
        } catch let error as MockUserServiceError {
            print("Test failed with MockUserServiceError: \(error.description)")
            XCTFail("Failed to create or fetch user: \(error.description)")
        } catch {
            print("Test failed with unexpected error: \(error.localizedDescription)")
            XCTFail("Failed to create or fetch user: \(error.localizedDescription)")
        }
    }
  
    func testUpdateUserProgress() async throws {
        // Arrange: Create a user and add them to the mock service
        let userId = "testUserId"
        let initialUser = User(
            id: userId,
            name: "Test User",
            email: "test@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 0,
            badgesEarned: 0,
            modulesCompleted: 0,
            totalStarsCollected: 0,
            currentModule: "Intro",
            currentLesson: LessonProgress(lessonName: "Lesson 1", totalStarsCollected: 5, accuracy: 95, feedback: "Great start")
        )
        try await mockUserService.createUser(initialUser)
        
        // Act: Update the user's lesson progress
        let updatedLessonProgress = LessonProgress(lessonName: "Lesson 2", totalStarsCollected: 10, accuracy: 90, feedback: "Keep it up!")
        try await mockUserService.updateUserProgress(userId: userId, progress: updatedLessonProgress)
        
        // Assert: Fetch the user again and verify that the lesson progress was updated
        let updatedUser = try await mockUserService.fetchUser(by: userId)
        XCTAssertEqual(updatedUser.currentLesson.lessonName, updatedLessonProgress.lessonName)
        XCTAssertEqual(updatedUser.currentLesson.totalStarsCollected, updatedLessonProgress.totalStarsCollected)
        XCTAssertEqual(updatedUser.currentLesson.accuracy, updatedLessonProgress.accuracy)
        XCTAssertEqual(updatedUser.currentLesson.feedback, updatedLessonProgress.feedback)
  }



}
