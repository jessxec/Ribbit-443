//
//  MainTabView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
      Group {
        TabView {
          ModulePathView()
            .tabItem {
              Image(systemName: "map.fill")
              Text("Modules")
            }
          
          ProgressPageView()
            .tabItem {
              Image(systemName: "chart.bar.fill")
              Text("Progress")
            }
          
          ProfilePage(badgeService: BadgeService())
            .tabItem {
              Image(systemName: "person.fill")
              Text("Profile")
            }
        }
      }
      .toolbarBackground(.visible, for: .tabBar)
      .toolbarBackground(Color.white, for: .tabBar)
      .accentColor(Color(hex: "#917FA2"))
    }
}
