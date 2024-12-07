//
//  LessonContentView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/1/24.
//
import SwiftUI

struct LessonContentView: View {
    let viewModel: WordViewModel
    let startPracticeAction: () -> Void
    let lessonId: String
    @Binding var showPractice: Bool // Bind to parent state
    
    var body: some View {
        NavigationStack {
            VStack {
                // Dynamic lesson view for specific tone lessons
                lessonView
                    .padding()
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    private var lessonView: some View {
        if let lesson = viewModel.lesson {
            switch lessonId {
            case "lesson1":
                FirstToneLessonView(lesson: lesson, showPractice: $showPractice) // Pass lesson and Binding
            case "lesson2":
                SecondToneLessonView(lesson: lesson, showPractice: $showPractice)
            case "lesson3":
                ThirdToneLessonView(lesson: lesson, showPractice: $showPractice)
            case "lesson4":
                FourthToneLessonView(lesson: lesson, showPractice: $showPractice)
            default:
                Text("Lesson not found")
            }
        } else {
            Text("Loading lesson...")
        }
    }
}
