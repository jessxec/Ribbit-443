  //
//  Module.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

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
    var content: [String]
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
    var transcriptionCheck: Formants // Placeholder for the transcription check
    var voiceProcessingCheck: String? // Placeholder for the voice processing check
    var starValue: Int
    var replayAllowed: Bool
    var samplePitchVectors: [Double] // Array of pitch data for the sample
    var userPitchVectors: [Double]? // Array of pitch data for the user recording
}

struct FormantsResponse: Codable {
    let feedback: [String]
    let formants: Formants
}

struct Formants: Codable {
    let F1: Double
    let F2: Double
}

struct PitchResponse: Codable {
    let pitch_values: [Double]
    let feedback: PitchFeedback
}

struct PitchFeedback: Codable {
    let average_feedback: String
    let section_feedback: [String]
}

struct Feedback: Codable {
    var incorrectPitch: String
    var incorrectPronunciation: String
}
