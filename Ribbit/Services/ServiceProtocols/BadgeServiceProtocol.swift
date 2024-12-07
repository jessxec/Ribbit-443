//
//  Untitled.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/1/24.
//

import Foundation

protocol BadgeServiceProtocol {
    func fetchBadges() async throws -> [Badge]
    func updateBadgeStatus(badgeId: String, dateReceived: Date) async throws
    func getIconURL(for badgeTitle: String) async throws -> URL
}
