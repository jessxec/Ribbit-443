//
//  BadgesPage.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//

import SwiftUI

struct BadgesPage: View {
    @StateObject private var viewModel: BadgeViewModel
    private let badgeService: BadgeServiceProtocol
    
    init(badgeService: BadgeServiceProtocol) {
        self.badgeService = badgeService
        _viewModel = StateObject(wrappedValue: BadgeViewModel(badgeService: badgeService))
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 16)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Back button
            HStack {
                BackButton()
                Spacer()
            }
            .padding(.horizontal)
            
            // Title and progress tracker
            HStack {
                Text("Badges")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(Color(hex: "#554C5D"))
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                
                Spacer()
                
                Text("\(viewModel.completedCount)/\(viewModel.badges.count)") // Explicitly use 'viewModel'
                    .font(.title2)
                    .foregroundColor(Color(hex: "#554C5D"))
            }
            .padding(.horizontal)
            
            // Badge grid or error message
            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.badges.isEmpty {
                Text("No badges available.")
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.badges, id: \.id) { badge in
                            NavigationLink(destination: BadgeDetailView(badge: badge, badgeService: badgeService)) {
                                BadgeGridItem(badge: badge, badgeService: badgeService)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .background(Color(hex: "FFFAF3"))
        .navigationBarBackButtonHidden(true)
        .task {
            await viewModel.loadBadges()
        }
    }
}



struct BadgeGridItem: View {
    let badge: Badge
    let badgeService: BadgeServiceProtocol
    @State private var iconURL: URL?
    
    var body: some View {
        VStack {
            if let iconURL = iconURL {
                AsyncImage(url: iconURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
                    .onAppear {
                        Task {
                            do {
                                iconURL = try await badgeService.getIconURL(for: badge.title)
                            } catch {
                                print("Failed to fetch icon URL for \(badge.title): \(error)")
                            }
                        }
                    }
            }
            
            Text(badge.title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: "#554C5D"))
                .padding(.top, 4)
        }
        .frame(width: 100, height: 120)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color(hex: "917FA2").opacity(0.1), radius: 4, x: 1, y: 10)
    }
}
