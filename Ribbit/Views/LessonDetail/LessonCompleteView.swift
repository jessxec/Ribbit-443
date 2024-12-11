//
//  LessonCompleteView.swift
//  Ribbit
//
//  Created by Jack Sun on 12/11/24.
//

import SwiftUI

struct LessonCompleteView: View {
    var body: some View {
        ZStack {
            // Background Image
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

                NavigationLink(destination: LessonListView()) {
                    Text("Go Back")
                        .padding()
                        .background(Color(hex: "917FA2"))
                        .foregroundColor(.white) // Ensure the text color contrasts with the background
                        .cornerRadius(12)
                }
                .padding()
            }
            .padding()
        }
    }
}
