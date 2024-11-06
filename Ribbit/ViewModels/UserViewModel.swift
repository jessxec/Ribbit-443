//
//  UserViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    
    @Published var user: User?
    @Published var isLoading = false
    @Published var errorMessage: String? // To display errors in the UI, if needed
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    // Function to fetch the user data
    func fetchUser(id: String) async {
        isLoading = true
        do {
            user = try await userService.fetchUser(by: id)
        } catch {
            errorMessage = "Failed to fetch user: \(error.localizedDescription)"
            print("Failed to fetch user:", error)
        }
        isLoading = false
    }
    
    // Function to update user progress in a module
    func updateUserProgress(moduleId: String, moduleProgress: ModuleProgress) async {
        guard let userId = user?.id else { return }
        isLoading = true
        do {
            try await userService.updateUserProgress(userId: userId, moduleId: moduleId, moduleProgress: moduleProgress)
            // Update local user object if needed, e.g., updating the progress locally after a successful API call
            if var updatedUser = user {
                updatedUser.progress[moduleId] = moduleProgress
                user = updatedUser
            }
        } catch {
            errorMessage = "Failed to update user progress: \(error.localizedDescription)"
            print("Failed to update user progress:", error)
        }
        isLoading = false
    }
    
    // Function to update daily goals
    func updateUserDailyGoals(dailyGoals: [String: DailyGoal]) async {
        guard let userId = user?.id else { return }
        isLoading = true
        do {
            try await userService.updateUserDailyGoals(userId: userId, dailyGoals: dailyGoals)
            // Optionally, update the local user data if daily goals are part of it
            if var updatedUser = user {
                updatedUser.dailyGoals = dailyGoals
                user = updatedUser
            }
        } catch {
            errorMessage = "Failed to update daily goals: \(error.localizedDescription)"
            print("Failed to update daily goals:", error)
        }
        isLoading = false
    }
    
    // Function to update badge progress
    func updateUserBadgeProgress(badgeId: Int, progress: BadgeProgress) async {
        guard let userId = user?.id else { return }
        isLoading = true
        do {
            try await userService.updateUserBadgeProgress(userId: userId, badgeId: badgeId, progress: progress)
            // Optionally, update the local user data for badges if needed
            if var updatedUser = user {
                if badgeId < updatedUser.badges.count {
                    updatedUser.badges[badgeId] = progress
                    user = updatedUser
                }
            }
        } catch {
            errorMessage = "Failed to update badge progress: \(error.localizedDescription)"
            print("Failed to update badge progress:", error)
        }
        isLoading = false
    }
    
}
