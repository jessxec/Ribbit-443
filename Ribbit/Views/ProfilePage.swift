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
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Header
                ProfileHeaderSection()
                
                // Streak and username section
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
                .padding(.horizontal, 30)
                
                // Scrollable content
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Accuracy Tracker Section
                        Text("Accuracy Tracker")
                            .font(.title2)
                            .padding(.leading, 40)
                            .foregroundColor(Color(hex: "#554C5D"))
                        
                        AccuracyChartView()
                            .frame(height: 180)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hex: "FFFAF3"))
                                    .shadow(color: Color(hex: "917FA2"), radius: 10, x: 2, y: 10)
                            )
                            .padding(.horizontal, 40)
                            .padding(.bottom, 15)
                        
                        // Badges Section
                        VStack(alignment: .center, spacing: 10) {
                            HStack {
                                Text("Badges")
                                    .font(.title2)
                                    .padding(.leading, 45)
                                    .foregroundColor(Color(hex: "#554C5D"))
                                Spacer()
                                NavigationLink(destination: BadgesPage(badgeService: BadgeService())) {
                                    Text("see more")
                                        .foregroundColor(Color(hex: "#554C5D"))
                                        .font(.subheadline)
                                        .underline()
                                        .padding(.trailing, 25)
                                }
                                .padding(.trailing, 25)
                            }
                            
                            // Badge grid or loading state
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
                                Text("Loading badges...")
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(maxHeight: .infinity) // Ensure ScrollView takes full height
                
                Spacer() // Push ScrollView content to fill the remaining space
            }
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
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(badgeService: BadgeService())
    }
}
