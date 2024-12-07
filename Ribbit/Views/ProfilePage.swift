//
//  ProfilePage.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//
import Foundation
import SwiftUI
import Charts

struct ProfilePage: View {
    @StateObject private var viewModel: BadgeViewModel
    
    init(badgeService: BadgeServiceProtocol) {
        _viewModel = StateObject(wrappedValue: BadgeViewModel(badgeService: badgeService))
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Header
                ProfileHeaderSection()
                HStack {
                    Circle()
                        .strokeBorder(Color(hex: "FF9F9F"), lineWidth: 4)
                        .frame(width: 90, height: 90)
                        .overlay(Text("C").font(.largeTitle))
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                    
                    Spacer()
                    
                    // Settings button
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .padding(.trailing)
                }
                .padding()
                .background(Color.purple.opacity(0.2))
                
                // Streak and user name
                HStack {
                    VStack(alignment: .leading) {
                        Text("Connor")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(hex: "#554C5D"))
                        
                        Text("@connorxD")
                            .foregroundColor(Color(hex: "#554C5D"))
                    }
                    .padding(.leading)
                    .padding(.top, 15)
                    Spacer()
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("3")
                            .font(.body)
                            .padding(.leading)
                            .bold()
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "917FA2"), lineWidth: 3))
                }
                .padding(.horizontal)
                
                // Accuracy Tracker Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Accuracy Tracker")
                        .font(.title2)
                        .padding(.leading, 25)
                        .foregroundColor(Color(hex: "#554C5D"))
                    
                    // Chart Box with Box Shadow Effect
                    AccuracyChartView()
                        .frame(height: 200)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(hex: "FFFAF3"))
                                .shadow(color: Color(hex: "917FA2"), radius: 10, x: 2, y: 10)
                        )
                        .padding(.horizontal, 20)
                }
                .padding(.top)

                // Badges Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Badges")
                            .font(.title2)
                            .padding(.leading, 25)
                            .foregroundColor(Color(hex: "#554C5D"))
                        Spacer()
                        NavigationLink(destination: BadgesPage(badgeService: BadgeService())) {
                            Text("see more")
                                .foregroundColor(Color(hex: "#554C5D"))
                                .font(.subheadline)
                                .underline() // Underline the text
                                .padding(.trailing, 35)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                    
                    // Horizontal Stack for badges with shadowed background
                    if !viewModel.badges.isEmpty {
                          HStack(spacing: 16) {
                              ForEach(viewModel.badges.prefix(4), id: \.id) { badge in
                                  BadgeView(badge: badge, badgeService: viewModel.badgeService)
                                      .frame(width: 60, height: 60)
                              }
                          }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hex: "FFFAF3"))
                                    .shadow(color: Color(hex: "917FA2"), radius: 10, x: 2, y: 10)
                            )
                            .padding(.horizontal, 20)
                    } else {
                        // If no badges loaded or empty, show a loading state or fallback message
                        Text("Loading badges...")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .background(Color(hex: "FFFAF3"))
            .task {
                await viewModel.loadBadges()
            }
        }
    }
}

struct BadgeView: View {
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
// Accuracy Chart View
struct AccuracyChartView: View {
    let data = [
        (tone: "Tone 1", accuracy: 78),
        (tone: "Tone 2", accuracy: 100),
        (tone: "Tone 3", accuracy: 100),
        (tone: "Tone 4", accuracy: 78)
    ]

    var body: some View {
        Chart(data, id: \.tone) { item in
            BarMark(
                x: .value("Tone", item.tone),
                y: .value("Accuracy", item.accuracy)
            )
            .foregroundStyle(Color(hex: "917FA2"))
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .frame(width: 60, height: 60)
    }
}




// Accuracy Chart View
struct AccuracyChartView: View {
    let data = [
        (tone: "Tone 1", accuracy: 78),
        (tone: "Tone 2", accuracy: 100),
        (tone: "Tone 3", accuracy: 100),
        (tone: "Tone 4", accuracy: 78)
    ]

    var body: some View {
        Chart(data, id: \.tone) { item in
            BarMark(
                x: .value("Tone", item.tone),
                y: .value("Accuracy", item.accuracy)
            )
            .foregroundStyle(Color(hex: "917FA2"))
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    }
}
