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
      ProfileHeaderSection()
      
      VStack {
          HStack {
              BackButton()
              Spacer()
          }
          .padding(.horizontal)
        
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
              .padding(.top, 30)
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
              .font(.title2)
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
                    .padding(.bottom, 30)
                }
              }
            } else {
              Text("Not Completed Yet")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.bottom, 30)
            }
          }
          .background(
              RoundedRectangle(cornerRadius: 15)
                  .fill(Color(hex: "FFFAF3"))
                  .shadow(color: Color(hex: "917FA2"), radius: 10, x: 2, y: 10)
          )
          .padding(.horizontal, 20)
          .padding(.top, 20)
                
          Spacer()
        }
        .background(Color(hex: "FFFAF3"))
        .navigationBarBackButtonHidden(true)
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
