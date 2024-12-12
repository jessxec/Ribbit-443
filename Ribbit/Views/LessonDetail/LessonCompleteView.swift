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
                Spacer()
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

                // Conditional NavigationLink
                if moduleId == "foundationsIsland" {
                    NavigationLink(destination: LessonListView()) {
                        Text("Go Back")
                            .padding()
                            .background(Color(hex: "917FA2"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                } else if moduleId == "airportModule" {
                    NavigationLink(destination: ThemedAirportLessonListView()) {
                        Text("Go Back")
                            .padding()
                            .background(Color(hex: "917FA2"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }else if moduleId == "cafeModule" {
                  NavigationLink(destination: ThemedCafeLessonListView()) {
                      Text("Go Back")
                          .padding()
                          .background(Color(hex: "917FA2"))
                          .foregroundColor(.white)
                          .cornerRadius(12)
                  }
              }else if moduleId == "beachModule" {
                NavigationLink(destination: ThemedBeachLessonListView()) {
                    Text("Go Back")
                        .padding()
                        .background(Color(hex: "917FA2"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }else if moduleId == "campingModule" {
              NavigationLink(destination: ThemedCampingLessonListView()) {
                  Text("Go Back")
                      .padding()
                      .background(Color(hex: "917FA2"))
                      .foregroundColor(.white)
                      .cornerRadius(12)
              }
          }

                Spacer()
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
