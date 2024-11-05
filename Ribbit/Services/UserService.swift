//
//  UserService.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import FirebaseFirestore

class UserService: UserServiceProtocol {
    private let db = Firestore.firestore()
    
    func fetchUser(by id: String) async throws -> User {
        let userDoc = db.collection("Users").document(id)
        let snapshot = try await userDoc.getDocument()
        guard let user = try? snapshot.data(as: User.self) else {
            throw NSError(domain: "UserService", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
        }
        return user
    }
    
    func createUser(_ user: User) async throws {
        let userDoc = db.collection("Users").document(user.id ?? "")
        try userDoc.setData(from: user)
    }

    func updateUserProgress(userId: String, moduleId: String, moduleProgress: ModuleProgress) async throws {
        let userDoc = db.collection("Users").document(userId)
        try await userDoc.updateData([
            "progress.\(moduleId)": [
                "completed": moduleProgress.completed,
                "starsCollected": moduleProgress.starsCollected,
                "lessons": moduleProgress.lessons.mapValues { lessonProgress in
                    [
                        "accuracy": lessonProgress.accuracy,
                        "completed": lessonProgress.completed,
                        "starsCollected": lessonProgress.starsCollected
                    ]
                }
            ]
        ])
    }
    
    func updateUserDailyGoals(userId: String, dailyGoals: [String: DailyGoal]) async throws {
        let userDoc = db.collection("Users").document(userId)
        try await userDoc.updateData(["dailyGoals": dailyGoals.mapValues { goal in
            [
                "completed": goal.completed,
                "lesson": goal.lesson,
                "module": goal.module
            ]
        }])
    }
    
  
    func updateUserBadgeProgress(userId: String, badgeId: Int, progress: BadgeProgress) async throws {
        let userDoc = db.collection("Users").document(userId)
        
        // Fetch the current user data
        let snapshot = try await userDoc.getDocument()
        guard var user = try? snapshot.data(as: User.self) else {
            throw NSError(domain: "UserService", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
        }
        
        // Ensure the badge index is within bounds
        guard badgeId < user.badges.count else {
            throw NSError(domain: "UserService", code: 400, userInfo: [NSLocalizedDescriptionKey: "Badge index out of bounds"])
        }
        
        // Update the specific badge in the array
        user.badges[badgeId] = progress
        
        // Write the entire badges array back to Firestore
        try await userDoc.updateData([
            "badges": user.badges.map { badge in
                [
                    "completed": badge.completed,
                    "completedDate": badge.completedDate ?? Timestamp(),
                    "description": badge.description,
                    "name": badge.name,
                    "progress": badge.progress
                ]
            }
        ])
    }

}
