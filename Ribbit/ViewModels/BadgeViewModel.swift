//
//  BadgeViewModel.swift
//  Ribbit
//
<<<<<<< HEAD
//  Created by Tracy Yang on 12/1/24.
//
import SwiftUI
import FirebaseFirestore

class BadgeViewModel: ObservableObject {
    @Published var badges: [Badge] = []
    
    private let db = Firestore.firestore()
    
    init() {
        fetchBadges()
    }
    
    func fetchBadges() {
        db.collection("Badges").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching badges: \(error)")
                return
            }
            self.badges = snapshot?.documents.compactMap { document in
                try? document.data(as: Badge.self)
            } ?? []
        }
    }
}

=======
//  Created by Jorge Urias on 12/1/24.
//

import Foundation

@MainActor
class BadgeViewModel: ObservableObject {
    private let badgeService: BadgeServiceProtocol
    @Published var badges: [Badge] = []
    @Published var errorMessage: String?

    init(badgeService: BadgeServiceProtocol) {
        self.badgeService = badgeService
    }

    func loadBadges() async {
        do {
            let badges = try await badgeService.fetchBadges()
            self.badges = badges
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    func updateBadge(badgeId: String) async {
        do {
            let dateReceived = Date()
            try await badgeService.updateBadgeStatus(badgeId: badgeId, dateReceived: dateReceived)
            await loadBadges() // Refresh badges after updating
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
>>>>>>> LessonContentView
