//
//  Badge.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct Badge: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let dateReceived: Date?
}
