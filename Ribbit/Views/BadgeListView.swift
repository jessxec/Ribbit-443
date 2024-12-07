//
//  BadgeListView.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//
import SwiftUI

struct BadgeListView: View {
    @StateObject private var viewModel: BadgeViewModel
    private let badgeService: BadgeServiceProtocol

    init(badgeService: BadgeServiceProtocol) {
        self.badgeService = badgeService
        _viewModel = StateObject(wrappedValue: BadgeViewModel(badgeService: badgeService))
    }

    var body: some View {
        NavigationView {
            List(viewModel.badges, id: \.id) { badge in // Ensure badges have unique IDs
                HStack {
                    if let url = URL(string: badge.icon) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        // Handle invalid URL or fallback to a default image
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(badge.title) // Make sure `Badge` has a `title` property
                            .font(.headline)
                        Text(badge.description) // Ensure `Badge` has a `description` property
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    if badge.dateReceived != nil { // Check if the badge is completed
                        Text("✅")
                            .font(.headline)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Badges")
            .task {
                await viewModel.loadBadges()
            }
        }
    }
}
