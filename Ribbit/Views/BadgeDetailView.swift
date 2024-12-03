//
//  BadgeDetailView.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//
import SwiftUI

struct BadgeDetailView: View {
    let badge: Badge
    
    var body: some View {
        VStack(spacing: 20) {
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

            Text(badge.title)
                .font(.title)
                .bold()
            
            Text(badge.description)
                .font(.body)
                .multilineTextAlignment(.center)
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

