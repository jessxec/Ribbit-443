//
//  RibbitApp.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/28/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
    
    // Comment out when updating firebase for populating Modules
//        Task {
//          do {
//             try await createModules()
//           }
//           catch {
//            print("Error")
//           }
//        }
    // Comment out when updating firebase for populating Badges
//    Task {
//        try await createBadges()
//    }

    return true
  }
}

@main
struct RibbitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var hasCompletedWelcome = false // Tracks navigation state
  
    var body: some Scene {
        WindowGroup {
            ProfilePage()
            //ContentView()
//            if hasCompletedWelcome {
//                MainTabView() // Show tabbed navigation after welcome/review
//            } else {
////                WelcomeFlowView(hasCompletedWelcome: $hasCompletedWelcome) // Welcome and review flow
//                HomeScreenP1()
//            }
            
        }
    }
}

