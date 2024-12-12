//
//  ProgressPageView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ProgressPageView: View {
    var value: Double

    init(value: Double) {
        self.value = value
    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.darkRed, lineWidth: 10)
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                Text("C")
                    .font(.largeTitle)
                    .foregroundColor(.darkPurple)
            }
            .padding(.top, 135)

            Text("Connor")
                .font(.largeTitle)
                .fontWeight(.light)
                .foregroundColor(.darkRed)

            Text("Daily Progress")
                .font(.title)
                .padding(.top, 20)
                .foregroundColor(.darkPurple)

            ProgressView(value: value, total: 2)
                .padding()
                .frame(maxWidth: 300)

            Text("Lessons Completed Today: 0/2")
                .font(.headline)
                .foregroundColor(.darkPurple)

            // Selected Lessons Section
            VStack(alignment: .leading, spacing: 20) {
                Text("Today's Goals")
                    .font(.headline)
                    .padding(.top)
                    .foregroundColor(.darkPurple)

                NavigationLink(destination: LessonListView()) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Foundations Island")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.darkPurple)
                        Text("The Basics of Mandarin")
                            .font(.title2)
                            .padding(.leading, 30)
                            .foregroundColor(.darkPurple)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "917FA2"), lineWidth: 7)
                )
                .cornerRadius(10)

                NavigationLink(destination: Text("Lesson 1 Content")) {
                    LessonRow(
                        number: 1,
                        title: "Tone One",
                        description: "flat tone",
                        example: "ā",
                        isUnlocked: true,
                        moduleId: "foundationsIsland",
                        lessonId: "lesson1"
                    )
                }
            }
            .padding()

            Spacer() // Allow space to grow, but tab bar will be at the bottom
        }
        .padding()
        .background(Color.offWhite)
        .frame(maxHeight: .infinity) // Makes sure the view fills the available space but keeps the tab bar at the bottom
        .edgesIgnoringSafeArea(.bottom) // Ensures the tab bar isn't pushed up by any content
    }
}

#Preview {
    ProgressPageView(value: 0)
}


#Preview {
    ProgressPageView(value: 0)
}
