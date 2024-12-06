//
//  ToneOneView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/6/24.
//
import SwiftUI

struct FirstToneLessonView: View {
    let lesson: Lesson
    let startPracticeAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(lesson.title)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)

            ScrollView {
                ForEach(lesson.content, id: \.self) { paragraph in
                    Text(paragraph)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 10)
                }
            }

            Button(action: startPracticeAction) {
                Text("Start Practice")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color(hex: "FFFAF3"))
    }
}
