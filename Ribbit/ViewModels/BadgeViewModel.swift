//
//  BadgeViewModel.swift
//  Ribbit
//  Created by Jorge Urias on 12/1/24.
//

import Foundation
import FirebaseStorage

@MainActor
class BadgeViewModel: ObservableObject {
    let badgeService: BadgeServiceProtocol
    @Published var badges: [Badge] = []
    @Published var errorMessage: String?
  
    // Computed property for progress tracker
    var completedCount: Int {
        badges.filter { $0.dateReceived != nil }.count
    }

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
  
    func getIconURL(for badge: Badge) async throws -> URL? {
        let storage = Storage.storage()
        let reference = storage.reference().child("badges/\(badge.icon)") // Assuming badge.icon is the filename
        return try await reference.downloadURL()
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
