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
    var moduleName: String
    var moduleDescription: String
    var starsToUnlock: Int
    var lessons: [Lesson]
}

struct Lesson: Codable {
    var lessonName: String
    var lessonContent: String
    var starsMax: Int
    var words: [Word]
}

struct Word: Codable {
    var word: String
    var audioSource: String
    var targetPitch: [Int]
}
