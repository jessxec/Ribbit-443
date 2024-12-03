//
//  MainTabView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Module Path Tab
            ModulePathView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Modules")
                }

            // Progress Page Tab
            ProgressPageView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Progress")
                }

            // Profile Tab
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color(hex: "#917FA2")) // Customize tab icon color
    }
}
