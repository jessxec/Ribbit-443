//
//  MainTabView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home
        case map
        case profile
    }

    var body: some View {
      VStack(spacing: 0) {
            // Content of the selected tab
            Group {
                switch selectedTab {
                case .home:
                  ProgressPageView().navigationBarBackButtonHidden(true)
                case .map:
                  ModulePathView().navigationBarBackButtonHidden(true)
                case .profile:
                  ProfilePage(badgeService: BadgeService()).navigationBarBackButtonHidden(true)
                }
            }
            

            // Custom Tab Bar
            ZStack {
                // Image as the custom shape for the navbar
                Image("Tabs/tabBackground")
                    .resizable()
                    .scaledToFill() // Ensure it covers the whole space
                    .frame(height: 100) // Adjust the height of the navbar
                    

                // Tab Bar Content
                HStack {
                    TabBarItem(
                        iconActive: "Tabs/Home/homeActive",
                        iconInactive: "Tabs/Home/home",
                        title: "Home",
                        isSelected: selectedTab == .home
                    ) {
                        selectedTab = .home
                    }
                    Spacer()
                          .frame(width: 80)

                    TabBarItem(
                        iconActive: "Tabs/Map/mapActive",
                        iconInactive: "Tabs/Map/map",
                        title: "Map",
                        isSelected: selectedTab == .map
                    ) {
                        selectedTab = .map
                    }
                    Spacer()
                          .frame(width: 80)

                    TabBarItem(
                        iconActive: "Tabs/Profile/profileActive",
                        iconInactive: "Tabs/Profile/profile",
                        title: "Profile",
                        isSelected: selectedTab == .profile
                    ) {
                        selectedTab = .profile
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    let iconActive: String
    let iconInactive: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // Dynamic Icon
            Image(isSelected ? iconActive : iconInactive)
            
            // Tab Title
            Text(title)
                .font(.caption)
                .foregroundColor(Color.mainDark)
                .fontWeight(isSelected ? .bold : .regular)

            // Line for selected tab
            RoundedRectangle(cornerRadius: 1)
                .fill(isSelected ? Color.mainDark : Color.clear)
                .frame(width: 22, height: 2)
        }
        .onTapGesture {
            action()
        }
    }
}
