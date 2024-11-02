//
//  MockUserService.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//


//class MockUserService: UserServiceProtocol {
//    var shouldReturnError = false
//
//    func fetchUser(by id: String, completion: @escaping (Result<User, Error>) -> Void) {
//        if shouldReturnError {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])))
//        } else {
//            let mockUser = User(
//                id: id,
//                name: "Test User",
//                email: "test@example.com",
//                dateJoined: Timestamp(date: Date()),
//                lastLogin: Timestamp(date: Date()),
//                streaks: 5,
//                badgesEarned: 3,
//                modulesCompleted: 2,
//                totalStarsCollected: 15,
//                currentModule: "Intro to Ribbit",
//                currentLesson: LessonProgress(
//                    lessonName: "Lesson 1",
//                    totalStarsCollected: 5,
//                    accuracy: 90,
//                    feedback: "Good progress"
//                )
//            )
//            completion(.success(mockUser))
//        }
//    }
//
//    func createUser(_ user: User, completion: @escaping (Error?) -> Void) {
//        completion(nil)
//    }
//    
//    func updateUserProgress(userId: String, progress: LessonProgress, completion: @escaping (Error?) -> Void) {
//        completion(nil)
//    }
//}


import Foundation
import FirebaseFirestore

enum MockUserServiceError: Error, CustomStringConvertible {
    case userNotFound
    case missingUserID
    case mockError
    case unknownError(description: String)
    
    var description: String {
        switch self {
        case .userNotFound:
            return "User not found in MockUserService."
        case .missingUserID:
            return "User ID is missing in the user object."
        case .mockError:
            return "A mock error was intentionally triggered."
        case .unknownError(let description):
            return description
        }
    }
}


class MockUserService: UserServiceProtocol {
    var shouldReturnError = false
    private var users: [String: User] = [:]

    init() {
        let defaultUser = User(
            id: "test-id",
            name: "Test User",
            email: "test@example.com",
            dateJoined: Timestamp(date: Date()),
            lastLogin: Timestamp(date: Date()),
            streaks: 5,
            badgesEarned: 3,
            modulesCompleted: 2,
            totalStarsCollected: 15,
            currentModule: "Intro to Ribbit",
            currentLesson: LessonProgress(
                lessonName: "Lesson 1",
                totalStarsCollected: 5,
                accuracy: 90,
                feedback: "Good progress"
            )
        )
        users[defaultUser.id!] = defaultUser
    }

    func fetchUser(by id: String) async throws -> User {
        if shouldReturnError {
            throw MockUserServiceError.mockError
        } else if let user = users[id] {
            return user
        } else {
            throw MockUserServiceError.userNotFound
        }
    }

    func createUser(_ user: User) async throws {
        if shouldReturnError {
            throw MockUserServiceError.mockError
        } else if let userId = user.id {
            users[userId] = user
        } else {
            throw MockUserServiceError.missingUserID
        }
    }
    
    func updateUserProgress(userId: String, progress: LessonProgress) async throws {
        if shouldReturnError {
            throw MockUserServiceError.mockError
        } else if var user = users[userId] {
            user.currentLesson = progress
            users[userId] = user
        } else {
            throw MockUserServiceError.userNotFound
        }
    }
}
