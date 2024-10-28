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
    var streaks: Int
    var badgesEarned: Int
    var modulesCompleted: Int
    var totalStarsCollected: Int
    var currentModule: String
    var currentLesson: LessonProgress
}

struct LessonProgress: Codable {
    var lessonName: String
    var totalStarsCollected: Int
    var accuracy: Int
    var feedback: String
}
