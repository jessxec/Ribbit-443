//
//  UserServiceProtocol.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

protocol UserServiceProtocol {
    /// Fetch a user by their ID.
    func fetchUser(by id: String) async throws -> User

    /// Create a new user with basic profile information.
    func createUser(_ user: User) async throws

    /// Update a user's progress within a specific module.
    func updateUserProgress(userId: String, moduleId: String, moduleProgress: ModuleProgress) async throws
    
    /// Update a user's daily goals.
    func updateUserDailyGoals(userId: String, dailyGoals: [String: DailyGoal]) async throws
    
    /// Update a user's badge progress.
    func updateUserBadgeProgress(userId: String, badgeId: Int, progress: BadgeProgress) async throws
}
