//
//  BadgeListView.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//
import SwiftUI

struct BadgesListView: View {
    @StateObject private var viewModel = BadgeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(viewModel.badges) { badge in
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
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(badge.title)
                                .font(.headline)
                            Text(badge.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        if let date = badge.dateReceived {
                            Text(date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        } else {
                            Button(action: {
                                Task {
                                    await viewModel.updateBadge(badgeId: badge.id)
                                }
                            }) {
                                Text("Mark as Completed")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Badges")
            .task {
                await viewModel.loadBadges()
            }
        }
    }
}
