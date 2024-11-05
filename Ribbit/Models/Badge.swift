//
//  Badge.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct Badge: Codable, Identifiable {
    var id: String?
    var name: String
    var description: String
    var criteria: Int
    var completed: Bool
    var completedDate: Timestamp?
    var icon: String
}
