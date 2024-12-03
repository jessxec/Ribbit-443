//
//  Badge.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct Badge: Codable, Identifiable {
<<<<<<< HEAD
    var id: String?
    var name: String
    var description: String
    var completed: Bool
    var completedDate: Timestamp?
    var icon: String
=======
    let id: String
    let title: String
    let description: String
    let icon: String
    let dateReceived: Date?
>>>>>>> LessonContentView
}
