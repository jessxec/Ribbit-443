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
    let moduleId: String // Add moduleId parameter
    @Binding var showPractice: Bool // Bind to parent state
    
    var body: some View {
        NavigationStack {
            VStack {
                // Dynamic lesson view based on module and lesson
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
            switch moduleId {
            case "foundationsIsland":
                module1LessonView(for: lessonId, lesson: lesson)
            case "airportModule":
                module2LessonView(for: lessonId, lesson: lesson)
            case "cafeModule":
                module3LessonView(for: lessonId, lesson: lesson)
            case "beachModule":
                module4LessonView(for: lessonId, lesson: lesson)
            case "campingModule":
                module5LessonView(for: lessonId, lesson: lesson)
            default:
                Text("Module not found")
            }
        } else {
            Text("Loading lesson...")
        }
    }
    
    @ViewBuilder
    private func module1LessonView(for lessonId: String, lesson: Lesson) -> some View {
        switch lessonId {
        case "lesson1":
            FirstToneLessonView(lesson: lesson, showPractice: $showPractice)
        case "lesson2":
            SecondToneLessonView(lesson: lesson, showPractice: $showPractice)
        case "lesson3":
            ThirdToneLessonView(lesson: lesson, showPractice: $showPractice)
        case "lesson4":
            FourthToneLessonView(lesson: lesson, showPractice: $showPractice)
        default:
            Text("Lesson not found in Module 1")
        }
    }
    
    @ViewBuilder
    private func module2LessonView(for lessonId: String, lesson: Lesson) -> some View {
        switch lessonId {
        case "lesson1":
          Module2Lesson1View(lesson: lesson, showPractice: $showPractice)
        case "lesson2":
          Module2Lesson2View(lesson: lesson, showPractice: $showPractice)
        case "lesson3":
          Module2Lesson3View(lesson: lesson, showPractice: $showPractice)
        default:
            Text("Lesson not found in Module 2")
        }
    }
    
  @ViewBuilder
  private func module3LessonView(for lessonId: String, lesson: Lesson) -> some View {
    switch lessonId {
    case "lesson1":
      Module3Lesson1View(lesson: lesson, showPractice: $showPractice)
    case "lesson2":
      Module3Lesson2View(lesson: lesson, showPractice: $showPractice)
    case "lesson3":
      Module3Lesson3View(lesson: lesson, showPractice: $showPractice)
    default:
      Text("Lesson not found in Module 3")
    }
  }
  @ViewBuilder
  private func module4LessonView(for lessonId: String, lesson: Lesson) -> some View {
    switch lessonId {
    case "lesson1":
      Module3Lesson1View(lesson: lesson, showPractice: $showPractice)
    case "lesson2":
      Module3Lesson2View(lesson: lesson, showPractice: $showPractice)
    case "lesson3":
      Module3Lesson3View(lesson: lesson, showPractice: $showPractice)
    default:
      Text("Lesson not found in Module 4")
    }
  }
    
    @ViewBuilder
    private func module5LessonView(for lessonId: String, lesson: Lesson) -> some View {
      switch lessonId {
      case "lesson1":
        Module3Lesson1View(lesson: lesson, showPractice: $showPractice)
      case "lesson2":
        Module3Lesson2View(lesson: lesson, showPractice: $showPractice)
      case "lesson3":
        Module3Lesson3View(lesson: lesson, showPractice: $showPractice)
      default:
        Text("Lesson not found in Module 5")
      }
    }
}
