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
    
    // Comment out when updating firebase 
//        Task {
//          do {
//             try await createModules()
//           }
//           catch {
//            print("Error")
//           }
//        }
    return true
  }
}

@main
struct RibbitApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeScreenP1()
            //ContentView()
        }
    }
}

