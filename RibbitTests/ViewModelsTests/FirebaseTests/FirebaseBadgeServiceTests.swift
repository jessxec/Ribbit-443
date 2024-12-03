//
//  FirebaseBadgeServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/1/24.
//
//
//  FirebaseBadgeServiceTests.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/1/24.
//

import XCTest
import FirebaseFirestore
@testable import Ribbit

final class FirebaseBadgeServiceTests: XCTestCase {
    var badgeService: BadgeService!

    override func setUp() {
        super.setUp()
        badgeService = BadgeService()
        Task {
            await populateBadges() // Populate badges before running tests
        }
    }

    private func populateBadges() async {
        let db = Firestore.firestore()
        let badges = [
            Badge(id: "first-steps", title: "First Steps", description: "Completed your first lesson!", icon: "first-steps-icon", dateReceived: nil),
            Badge(id: "language-explorer", title: "Language Explorer", description: "Completed 5 lessons!", icon: "language-explorer-icon", dateReceived: nil),
            Badge(id: "tone-master", title: "Tone Master", description: "Mastered all tones!", icon: "tone-master-icon", dateReceived: nil),
            Badge(id: "daily-grinder", title: "Daily Grinder", description: "Logged in for 7 consecutive days!", icon: "daily-grinder-icon", dateReceived: nil)
        ]

        for badge in badges {
            let badgeRef = db.collection("badges").document(badge.id)
            do {
                try badgeRef.setData(from: badge)
                print("Badge \(badge.title) added successfully!")
            } catch {
                print("Error adding badge \(badge.title): \(error.localizedDescription)")
            }
        }
    }

    func testFetchBadges() async {
        do {
            let badges = try await badgeService.fetchBadges()
            XCTAssertFalse(badges.isEmpty, "Badges should not be empty")
            print("Fetched badges: \(badges)")
        } catch {
            XCTFail("Fetching badges failed: \(error)")
        }
    }

    func testUpdateBadgeStatus() async {
        let testBadgeId = "first-steps"
        do {
            let date = Date()
            try await badgeService.updateBadgeStatus(badgeId: testBadgeId, dateReceived: date)
            XCTAssertTrue(true, "Badge status updated successfully")
            print("Badge status updated successfully for badge ID \(testBadgeId)")
        } catch {
            XCTFail("Updating badge status failed: \(error)")
        }
    }

    func testFetchSingleBadge() async {
        let testBadgeId = "first-steps"
        do {
            let badges = try await badgeService.fetchBadges()
            guard let badge = badges.first(where: { $0.id == testBadgeId }) else {
                XCTFail("Badge with ID \(testBadgeId) not found")
                return
            }

            XCTAssertEqual(badge.id, testBadgeId, "Fetched badge ID should match")
            print("Fetched Badge: \(badge.title), Date Received: \(badge.dateReceived ?? Date())")
        } catch {
            XCTFail("Fetching single badge failed: \(error)")
        }
    }
}
