//
//  ProfilePage.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/1/24.
//

import Foundation
import SwiftUI

struct ProfilePage: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Profile Header
                HStack {
                    Circle()
                        .strokeBorder(Color(hex: "FF9F9F"), lineWidth: 4)
                        .frame(width: 90, height: 90)
                        .overlay(Text("C").font(.largeTitle))
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
                        
                        Text("@connorxD")
                            .foregroundColor(.gray)
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
                
                // Achievements Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Achievements")
                        .font(.title2)
                        .padding(.leading, 25)
                    
                    // Box with shadow effect
                    HStack(spacing: 30) {
                        AchievementView(count: 312, color: .purple)
                        AchievementView(count: 159, color: .yellow)
                        AchievementView(count: 74, color: .gray)
                        AchievementView(count: 98, color: .gray.opacity(0.7))
                    }
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
                        Spacer()
                        NavigationLink(destination: BadgesPage()) {
                            Text("see more")
                                .foregroundColor(Color(hex: "#554C5D"))
                                .font(.subheadline)
                                .underline() // Underline the text
                                .padding(.trailing, 35)
                        }
                    }
                    
                    HStack(spacing: 30) {
                        BadgeView(systemName: "medal.fill", color: .yellow)
                        BadgeView(systemName: "medal.fill", color: .gray)
                        BadgeView(systemName: "trophy.fill", color: .yellow)
                        BadgeView(systemName: "medal.fill", color: .orange)
                        BadgeView(systemName: "trophy.fill", color: .yellow)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hex: "FFFAF3"))
                            .shadow(color: Color(hex: "917FA2"), radius: 10, x: 2, y: 10)
                    )
                    .padding(.horizontal, 20)
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .background(Color(hex: "FFFAF3"))
        }
    }
}

struct AchievementView: View {
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Circle()
                .fill(color)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                )
            Text("\(count)")
                .font(.subheadline)
        }
    }
}

struct BadgeView: View {
    let systemName: String
    let color: Color
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(color)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
