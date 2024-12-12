//
//  ThemedAirportLessonListView.swift
//  Ribbit
//
//  Created by Jessie Chen on 12/12/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct ThemedAirportLessonListView: View {
    @State private var navigateToMainTab = false // Flag to control navigation

    init() {
        // This will remove the navigation bar background globally for this view
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear // Remove background color

        // Apply the transparent background style
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    // Background Image
                    Image("airport")
                        .resizable()
                        .scaledToFill() // Ensure the image fills the available space
                        .frame(width: UIScreen.main.bounds.width) // Full width
                        .clipped() // Clip overflow

                    // Content
                    VStack {
                        // Title
                        Text("Airport")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundColor(.darkPurple) // Make the title stand out
                            .padding(.top, 110)

                        // Description Text
                        Text("Navigating Through the Airport")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(.darkPurple)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.top, 220)

                        // Difficulty Rating
                        HStack {
                            Text("Difficulty:")
                                .foregroundColor(.lightTeal)
                            Image("star") // Fill star
                            Image("starOff") // Empty star
                            Image("starOff") // Empty star
                        }

                        VStack(spacing: 15) {
                            // Tone 1 Lesson
                            NavigationLink(destination: Text("Lesson 1 Content")) {
                                LessonRow(
                                    number: 1,
                                    title: "Compound Finals",
                                    description: "ai, ei, ao, ou",
                                    example: "飞",
                                    isUnlocked: true,
                                    moduleId: "airportModule",
                                    lessonId: "lesson1"
                                )
                            }

                            // Tone 2 Lesson
                            NavigationLink(destination: Text("Lesson 2 Content")) {
                                LessonRow(
                                    number: 2,
                                    title: "Nasal Finals",
                                    description: "an, en, in, un",
                                    example: "门",
                                    isUnlocked: true,
                                    moduleId: "airportModule",
                                    lessonId: "lesson2"
                                )
                            }

                            // Tone 3 Lesson
                            NavigationLink(destination: Text("Lesson 3 Content")) {
                                LessonRow(
                                    number: 3,
                                    title: "Building Words",
                                    description: "jing, tang, fang",
                                    example: "北京",
                                    isUnlocked: false,
                                    moduleId: "airportModule",
                                    lessonId: "lesson3"
                                )
                            }
                        }
                        .padding(.top, 20)

                        Spacer()
                    }
                    // Add padding on both sides
                    .padding(.horizontal, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                // Navigate to MainTabView
                self.navigateToMainTab = true
            }) {
                HStack(spacing: 2) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                        .foregroundColor(Color(hex: "#554C5D"))
                }
                .foregroundColor(Color(hex: "#917FA2"))
            })
            .navigationDestination(isPresented: $navigateToMainTab) {
                MainTabView()
            }
            .navigationBarBackButtonHidden(true) // Hide default back button
            .edgesIgnoringSafeArea(.top) // Allow content to extend behind the navigation bar
        }
    }
}

//struct ThemedAirportLessonListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemedAirportLessonListView()
//    }
//}
