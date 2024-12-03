//
//  BadgeViewModel.swift
//  Ribbit
//
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
