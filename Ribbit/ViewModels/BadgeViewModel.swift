//
//  BadgeViewModel.swift
//  Ribbit
//
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
        db.collection("badges").getDocuments { snapshot, error in
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

