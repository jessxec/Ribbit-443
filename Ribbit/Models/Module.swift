//
//  Module.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

//import Foundation
//import FirebaseFirestore
//
//struct Module: Codable, Identifiable {
//    var id: String?
//    var moduleName: String
//    var moduleDescription: String
//    var starsToUnlock: Int
//    var lessons: [Lesson]?
//}
//
//struct Lesson: Codable {
//    var lessonName: String
//    var lessonContent: String
//    var starsMax: Int
//    var words: [Word]
//}
//
//struct Word: Codable {
//    var word: String
//    var audioSource: String
//    var targetPitch: [Int]
//}

import Foundation
import FirebaseFirestore

struct Module: Codable, Identifiable {
    var id: String?
    var title: String
    var starsRequired: Int
    var isUnlocked: Bool
    var totalStarsAvailable: Int
    var lessons: [Lesson]
}

struct Lesson: Codable, Identifiable {
    var id: String
    var title: String
    var lessonOrder: Int
    var totalStarsAvailable: Int
    var words: [Word]
}

struct Word: Codable, Identifiable {
    var id: String
    var pinyin: String
    var word: String
    var translation: String
    var audioPath: String
    var starsForAccuracy: [String: Int] // Dictionary with accuracy ranges as keys and star values as Int
    var feedback: Feedback
    var transcriptionCheck: String? // Placeholder for the transcription check
    var voiceProcessingCheck: String? // Placeholder for the voice processing check
    var starValue: Int
    var replayAllowed: Bool
}

struct Feedback: Codable {
    var incorrectPitch: String
    var incorrectPronunciation: String
}
