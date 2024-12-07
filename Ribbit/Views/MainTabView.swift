//
//  MainTabView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var showTabBar: Bool = true

    var body: some View {
        ZStack {
            if showTabBar {
                TabView {
                    ModulePathView(showTabBar: $showTabBar)
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
                .accentColor(Color(hex: "#917FA2"))
            } else {
                // Placeholder for views that don't need the TabView
                EmptyView()
            }
        }
    }
}
