//
//  BadgeService.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/1/24.
//

import Foundation
import FirebaseFirestore

class BadgeService: BadgeServiceProtocol {
    private let db = Firestore.firestore()

    func fetchBadges() async throws -> [Badge] {
        try await withCheckedThrowingContinuation { continuation in
            db.collection("Badges").getDocuments { snapshot, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let documents = snapshot?.documents else {
                    continuation.resume(throwing: NSError(domain: "No documents", code: 0, userInfo: nil))
                    return
                }

                let badges: [Badge] = documents.compactMap { doc in
                    try? doc.data(as: Badge.self)
                }
                continuation.resume(returning: badges)
            }
        }
    }

    func updateBadgeStatus(badgeId: String, dateReceived: Date) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            let badgeRef = db.collection("Badges").document(badgeId)
            badgeRef.updateData(["dateReceived": dateReceived]) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }
}
