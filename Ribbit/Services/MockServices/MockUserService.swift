//
//  MockUserService.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import Foundation
import FirebaseFirestore

class MockUserService: UserServiceProtocol {
    var shouldReturnError = false

    func fetchUser(by id: String, completion: @escaping (Result<User, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock Error"])))
        } else {
            let mockUser = User(
                id: id,
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
            completion(.success(mockUser))
        }
    }

    func createUser(_ user: User, completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    func updateUserProgress(userId: String, progress: LessonProgress, completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}
