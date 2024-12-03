//
//  ProfileView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
                .padding()

            Text("Connor")
                .font(.headline)
                .padding()

            HStack(spacing: 20) {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
                Text("Streak: 3 days")
            }
            .padding()

            // Example badges section
            Text("Badges")
                .font(.headline)
                .padding(.top)

            HStack(spacing: 15) {
                ForEach(0..<4) { _ in
                    Image(systemName: "medal.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                }
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}
