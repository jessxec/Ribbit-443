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
      .onAppear() {
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: "F5F0EA"))
      }
      .tint(Color(hex: "#917FA2"))
      .navigationBarBackButtonHidden(true)
    }
}
