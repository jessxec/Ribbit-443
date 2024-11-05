//
//  FirebaseUserServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/2/24.
//

import XCTest
import FirebaseFirestore
@testable import Ribbit

class FirebaseUserServiceTests: XCTestCase {
    private let db = Firestore.firestore()
    private var userService: UserService!

    override func setUp() async throws {
        try await super.setUp()
        userService = UserService()
//        try await deleteTestUsers() // Clean up any existing test data
    }

//    override func tearDown() async throws {
//        try await deleteTestUsers() // Clean up after each test
//        userService = nil
//        try await super.tearDown()
//    }

    // Helper function to delete test users after each test
//    private func deleteTestUsers() async throws {
//        let usersCollection = db.collection("Users")
//        let snapshot = try await usersCollection.getDocuments()
//        for document in snapshot.documents {
//            if document.documentID.starts(with: "test") {
//                try await usersCollection.document(document.documentID).delete()
//            }
//        }
//    }

    // Test case for fetching a user by ID
    func testFetchUser() async throws {
        let testUserId = "testFetchUserId"
        let testUser = User(
            id: testUserId,
            name: "Fetch Test User",
            email: "fetchuser@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            badgesEarned: 2,
            modulesCompleted: 1,
            streaks: 5,
            totalStarsCollected: 15,
            currentModule: "module1",
            currentLesson: "lesson1",
            badges: [
                BadgeProgress(completed: true, completedDate: Timestamp(date: Date()), description: "Badge 1", name: "Beginner", progress: 3),
                BadgeProgress(completed: false, completedDate: nil, description: "Badge 2", name: "Intermediate", progress: 1)
            ],
            dailyGoals: [
                "goal1": DailyGoal(completed: false, lesson: "Lesson 1", module: "Module 1")
            ],
            progress: [
                "module1": ModuleProgress(
                    completed: false,
                    lessons: [
                        "lesson1": LessonProgress(accuracy: 90, completed: true, starsCollected: 5),
                        "lesson2": LessonProgress(accuracy: 75, completed: false, starsCollected: 3)
                    ],
                    starsCollected: 8
                )
            ]
        )

        // Create the user in Firebase
        try await userService.createUser(testUser)

        // Fetch the user from Firebase
        let fetchedUser = try await userService.fetchUser(by: testUserId)

        // Verify the fetched data matches the created data
        XCTAssertEqual(fetchedUser.id, testUser.id)
        XCTAssertEqual(fetchedUser.name, "Fetch Test User")
        XCTAssertEqual(fetchedUser.email, "fetchuser@example.com")
        XCTAssertEqual(fetchedUser.badgesEarned, 2)
        XCTAssertEqual(fetchedUser.modulesCompleted, 1)
        XCTAssertEqual(fetchedUser.streaks, 5)
        XCTAssertEqual(fetchedUser.totalStarsCollected, 15)
        XCTAssertEqual(fetchedUser.currentModule, "module1")
        XCTAssertEqual(fetchedUser.currentLesson, "lesson1")

        // Verify badges
        XCTAssertEqual(fetchedUser.badges.count, 2)
        XCTAssertEqual(fetchedUser.badges[0].completed, true)
        XCTAssertEqual(fetchedUser.badges[0].name, "Beginner")
        XCTAssertEqual(fetchedUser.badges[0].progress, 3)
        XCTAssertEqual(fetchedUser.badges[1].completed, false)
        XCTAssertEqual(fetchedUser.badges[1].name, "Intermediate")
        XCTAssertEqual(fetchedUser.badges[1].progress, 1)

        // Verify daily goals
        XCTAssertEqual(fetchedUser.dailyGoals["goal1"]?.completed, false)
        XCTAssertEqual(fetchedUser.dailyGoals["goal1"]?.lesson, "Lesson 1")
        XCTAssertEqual(fetchedUser.dailyGoals["goal1"]?.module, "Module 1")

        // Verify progress in modules
        let moduleProgress = fetchedUser.progress["module1"]
        XCTAssertEqual(moduleProgress?.completed, false)
        XCTAssertEqual(moduleProgress?.starsCollected, 8)
        XCTAssertEqual(moduleProgress?.lessons["lesson1"]?.accuracy, 90)
        XCTAssertEqual(moduleProgress?.lessons["lesson1"]?.completed, true)
        XCTAssertEqual(moduleProgress?.lessons["lesson2"]?.accuracy, 75)
        XCTAssertEqual(moduleProgress?.lessons["lesson2"]?.completed, false)
    }

    // Test case for creating a user
    func testCreateUser() async throws {
        let testUserId = "testUserId"
        let testUser = User(
            id: testUserId,
            name: "Test User",
            email: "testuser@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            badgesEarned: 0,
            modulesCompleted: 0,
            streaks: 0,
            totalStarsCollected: 0,
            currentModule: "",
            currentLesson: "",
            badges: [],
            dailyGoals: [:],
            progress: [:]
        )

        try await userService.createUser(testUser)

        let fetchedUser = try await userService.fetchUser(by: testUserId)
        XCTAssertEqual(fetchedUser.id, testUser.id)
        XCTAssertEqual(fetchedUser.name, "Test User")
        XCTAssertEqual(fetchedUser.email, "testuser@example.com")
    }

    // Test case for updating user progress in a module
    func testUpdateUserProgress() async throws {
        let testUserId = "testUserProgressId"
        let testUser = User(
            id: testUserId,
            name: "Progress Test User",
            email: "progressuser@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            badgesEarned: 0,
            modulesCompleted: 0,
            streaks: 0,
            totalStarsCollected: 0,
            currentModule: "",
            currentLesson: "",
            badges: [],
            dailyGoals: [:],
            progress: [:]
        )

        try await userService.createUser(testUser)

        let moduleProgress = ModuleProgress(
            completed: false,
            lessons: [
                "lesson1": LessonProgress(accuracy: 90, completed: true, starsCollected: 5),
                "lesson2": LessonProgress(accuracy: 75, completed: false, starsCollected: 3)
            ],
            starsCollected: 8
        )

        try await userService.updateUserProgress(userId: testUserId, moduleId: "module1", moduleProgress: moduleProgress)

        let fetchedUser = try await userService.fetchUser(by: testUserId)
        let fetchedModuleProgress = fetchedUser.progress["module1"]

        XCTAssertEqual(fetchedModuleProgress?.completed, false)
        XCTAssertEqual(fetchedModuleProgress?.starsCollected, 8)
        XCTAssertEqual(fetchedModuleProgress?.lessons["lesson1"]?.accuracy, 90)
        XCTAssertEqual(fetchedModuleProgress?.lessons["lesson1"]?.completed, true)
        XCTAssertEqual(fetchedModuleProgress?.lessons["lesson2"]?.completed, false)
    }

      // Test case for updating user daily goals
      func testUpdateUserDailyGoals() async throws {
          let testUserId = "testDailyGoalsId"
          let testUser = User(
              id: testUserId,
              name: "Daily Goals Test User",
              email: "dailygoaluser@example.com",
              dateJoined: Timestamp(date: Date()),
              lastLogin: Timestamp(date: Date()),
              badgesEarned: 0,
              modulesCompleted: 0,
              streaks: 0,
              totalStarsCollected: 0,
              currentModule: "",
              currentLesson: "",
              badges: [],
              dailyGoals: [:],
              progress: [:]
          )

          try await userService.createUser(testUser)

          let dailyGoals = [
              "goal1": DailyGoal(completed: false, lesson: "Lesson 1", module: "Module 1"),
              "goal2": DailyGoal(completed: true, lesson: "Lesson 2", module: "Module 2")
          ]

          try await userService.updateUserDailyGoals(userId: testUserId, dailyGoals: dailyGoals)

          let fetchedUser = try await userService.fetchUser(by: testUserId)
          XCTAssertEqual(fetchedUser.dailyGoals["goal1"]?.completed, false)
          XCTAssertEqual(fetchedUser.dailyGoals["goal2"]?.completed, true)
      }

      // Test case for updating user badge progress
      func testUpdateUserBadgeProgress() async throws {
          let testUserId = "testBadgeProgressId"
          let testUser = User(
              id: testUserId,
              name: "Badge Progress Test User",
              email: "badgeuser@example.com",
              dateJoined: Timestamp(date: Date()),
              lastLogin: Timestamp(date: Date()),
              badgesEarned: 0,
              modulesCompleted: 0,
              streaks: 0,
              totalStarsCollected: 0,
              currentModule: "",
              currentLesson: "",
              badges: [
                  BadgeProgress(completed: false, completedDate: nil, description: "Badge 1", name: "Baby Steps", progress: 1)
              ],
              dailyGoals: [:],
              progress: [:]
          )
          
          // Create the user in Firestore
          try await userService.createUser(testUser)
          
          // Wait a moment to ensure the user document is saved in Firestore
//          try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds delay

          // Attempt to fetch the user to confirm creation
          let createdUser = try await userService.fetchUser(by: testUserId)
          XCTAssertEqual(createdUser.id, testUserId) // Confirm user was created

          // Update badge progress
          let updatedBadgeProgress = BadgeProgress(completed: true, completedDate: Timestamp(date: Date()), description: "Updated Badge", name: "Baby Steps", progress: 5)
          try await userService.updateUserBadgeProgress(userId: testUserId, badgeId: 0, progress: updatedBadgeProgress)

          // Fetch the updated user
          let fetchedUser = try await userService.fetchUser(by: testUserId)
          
          // Verify the badge was updated correctly
          XCTAssertEqual(fetchedUser.badges[0].completed, true)
          XCTAssertEqual(fetchedUser.badges[0].progress, 5)
      }

}
