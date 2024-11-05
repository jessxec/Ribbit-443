//
//  User.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable {
    var id: String?
    var name: String
    var email: String
    var dateJoined: Timestamp
    var lastLogin: Timestamp
    var badgesEarned: Int
    var modulesCompleted: Int
    var streaks: Int
    var totalStarsCollected: Int
    var currentModule: String
    var currentLesson: String
    var badges: [BadgeProgress] // badges as an array of badge maps
    var dailyGoals: [String: DailyGoal] // dailyGoals as a map of goal maps
    var progress: [String: ModuleProgress] // progress as a map of module maps
}

struct BadgeProgress: Codable {
    var completed: Bool
    var completedDate: Timestamp?
    var description: String // Description of the badge
    var name: String        // Name of the badge
    var progress: Int
}

struct DailyGoal: Codable {
    var completed: Bool
    var lesson: String
    var module: String
}

struct ModuleProgress: Codable {
    var completed: Bool // Indicates if the module is completed
    var lessons: [String: LessonProgress] // Map of lessons within the module
    var starsCollected: Int
}

struct LessonProgress: Codable {
    var accuracy: Int
    var completed: Bool
    var starsCollected: Int
}
