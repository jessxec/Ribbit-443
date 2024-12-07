//
//  BadgeDetailView.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//
import SwiftUI

struct BadgeDetailView: View {
    let badge: Badge

    private let badgeService: BadgeServiceProtocol
    @State private var iconURL: URL?

    init(badge: Badge, badgeService: BadgeServiceProtocol) {
        self.badge = badge
        self.badgeService = badgeService
    }
    
    var body: some View {
      VStack {
          VStack(spacing: 20) {
            if let iconURL = iconURL {
              AsyncImage(url: iconURL) { image in
                image
                  .resizable()
                  .frame(width: 80, height: 80)
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
              .font(.title)
              .foregroundColor(Color(hex: "#554C5D"))
              .bold()
            
            Text(badge.description)
              .font(.body)
              .multilineTextAlignment(.center)
              .foregroundColor(Color(hex: "#554C5D"))
              .padding()
            
            if badge.dateReceived != nil {
              VStack {
                Text("Completed ✅")
                  .font(.headline)
                  .foregroundColor(.green)
                if let completedDate = badge.dateReceived {
                  Text("Date: \(completedDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
              }
            } else {
              Text("Not Completed Yet")
                .font(.headline)
                .foregroundColor(.red)
            }
          }
                
                Spacer()
            }
        .padding()
        .navigationTitle(Text(badge.title))
    }
}



private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

