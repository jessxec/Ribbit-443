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
    
        // Populate Firebase with module data
//        Task {
//            do {
//                try await createModules()  // This will upload data only once when you run the app
//                print("Module data populated successfully.")
//            } catch {
//                print("Failed to populate module data: \(error)")
//            }
//        }

    
    
    return true
  }
}

@main
struct RibbitApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
