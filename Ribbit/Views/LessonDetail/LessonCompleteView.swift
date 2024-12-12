//
//  LessonCompleteView.swift
//  Ribbit
//
//  Created by Jack Sun on 12/11/24.
//

//
//  LessonCompleteView.swift
//  Ribbit
//
//  Created by Jack Sun on 12/11/24.
//

import SwiftUI
//
//  LessonCompleteView.swift
//  Ribbit
//
//  Created by Jack Sun on 12/11/24.
//

import SwiftUI

struct LessonCompleteView: View {
    @EnvironmentObject var badgeViewModel: BadgeViewModel // Inject the BadgeViewModel
    let moduleId: String
    let lessonId: String

    @State private var badgeUnlocked: Bool = false // Track badge unlock status

    var body: some View {
        ZStack {
            Image("end_of_lesson")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .padding()
                    .cornerRadius(8)

                Text("You've completed the lesson.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(8)

                if badgeUnlocked {
                    Button(action: {}) {
                        Text("New Badge Unlocked!")
                            .padding()
                            .background(Color(hex: "917FA2"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding()
                }

                NavigationLink(destination: LessonListView()) {
                    Text("Go Back")
                        .padding()
                        .background(Color(hex: "917FA2"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
            }
            .padding()
        }
        .onAppear {
            Task {
                if moduleId == "airportModule" && lessonId == "lesson3" {
                    await badgeViewModel.unlockBadge(badgeId: "airport-navigator")
                    badgeUnlocked = true // Show the button if badge is unlocked
                } else if moduleId == "foundationsIsland" && lessonId == "lesson4" {
                    await badgeViewModel.unlockBadge(badgeId: "baby-steps")
                    badgeUnlocked = true // Show the button if badge is unlocked
                }
            }
        }
    }
}
