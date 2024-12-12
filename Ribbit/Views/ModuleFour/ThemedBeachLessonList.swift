//
//  ThemedBeachLessonList.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/12/24.
//


import Foundation
import SwiftUI
import FirebaseFirestore

struct ThemedBeachLessonListView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
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
          Image("beach")
            .resizable()
            .scaledToFill() // Ensure the image fills the available space
            .frame(width: UIScreen.main.bounds.width) // Full width
            .clipped() // Clip overflow

          // Content
          VStack {
            // Title
            Text("Beach")
              .font(.largeTitle)
              .fontWeight(.medium)
              .foregroundColor(.darkPurple) // Make the title stand out
              .padding(.top, 110)

            // Description Text
            Text("Sunny Day at the Beach")
              .font(.title)
              .fontWeight(.light)
              .foregroundColor(.darkPurple)
              .multilineTextAlignment(.center)
              .padding(.horizontal, 40)
              .padding(.top, 220)

            // Difficulty Rating
            HStack {
              Text("Difficulty:")
                .foregroundColor(.darkTeal)
              Image("star") // Fill star
              Image("star") // Empty star
              Image("starOff") // Empty star
            }

            VStack(spacing: 15) {
              // Tone 1 Lesson
              NavigationLink(destination: Text("Lesson 1 Content")
              ) {
                LessonRow(
                  number: 1,
                  title: "Vowel Harmony I.",
                  description: "a, o, u",
                  example: "太阳",
                  isUnlocked: true,
                  moduleId: "beachModule",
                  lessonId: "lesson1"
                )
              }
              
              // Tone 2 Lesson
              NavigationLink(destination: Text("Lesson 2 Content")
              ) {
                LessonRow(
                  number: 2,
                  title: "Vowel Harmony II.",
                  description: "ai, ou, ui",
                  example: "冰淇淋",
                  isUnlocked: true,
                  moduleId: "beachModule",
                  lessonId: "lesson2"
                )
              }
              
              // Tone 3 Lesson
              NavigationLink(destination: Text("Lesson 3 Content")
              ) {
                LessonRow(
                  number: 3,
                  title: "Tone Variations",
                  description: "ai, u, ü",
                  example: "海滩",
                  isUnlocked: false,
                  moduleId: "beachModule",
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
      .navigationBarBackButtonHidden(false) // Ensure the back button is visible
      .navigationBarTitleDisplayMode(.inline) // Inline title without large background
      .edgesIgnoringSafeArea(.top) // Allow content to extend behind the navigation bar
    }
  }
}
