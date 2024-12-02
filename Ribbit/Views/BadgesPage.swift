//
//  BadgesPage.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//

import SwiftUI

struct BadgesPage: View {
    @StateObject private var viewModel = BadgeViewModel()
    
    var body: some View {
        List(viewModel.badges) { badge in
            NavigationLink(destination: BadgeDetailView(badge: badge)) {
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
                        Text(badge.name)
                            .font(.headline)
                        Text(badge.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    if badge.completed {
                        Text("✅")
                            .font(.headline)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("All Badges")
        .onAppear {
            viewModel.fetchBadges()
        }
    }
}
