//
//  LessonContentView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/1/24.
//
import SwiftUI

struct LessonContentView: View {
    let lessonId: String
    let content: [String]
    
    @ViewBuilder
    var body: some View {
        switch lessonId {
        case "lesson1":
            LessonTypeAView(content: content)
        case "lesson2":
            LessonTypeBView(content: content)
        default:
            Text("Lesson not found")
        }
    }
}


struct LessonTypeAView: View {
    let content: [String]
    var body: some View {
        VStack {
            Text("Lesson Type A")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            ForEach(content, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct LessonTypeBView: View {
    let content: [String]
    var body: some View {
        VStack {
            Text("Lesson Type B")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            ForEach(content, id: \.self) { item in
                Text(item)
            }
        }
    }
}

// Repeat for LessonTypeCView, LessonTypeDView, etc.

//struct LessonContentView: View {
//    let viewModel: WordViewModel
//    let startPracticeAction: () -> Void
//    
//    @State private var currentPage = 0 // Track the current page index
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//                ProgressBarBackButton(currentPage: currentPage + 1, totalPages: viewModel.lesson?.content.count ?? 1)
//                
//                TabView(selection: $currentPage) {
//                    if let content = viewModel.lesson?.content {
//                        ForEach(0..<content.count, id: \.self) { index in
//                            VStack(alignment: .leading, spacing: 20) {
//                                Text(viewModel.lesson?.title ?? "Lesson")
//                                    .font(.largeTitle)
//                                    .bold()
//                                    .padding(.bottom, 20)
//                                
//                                Text(content[index])
//                                    .font(.body)
//                                    .multilineTextAlignment(.leading)
//                                    .padding(.horizontal)
//                                
//                                Spacer()
//                            }
//                            .tag(index) // Tag each page with its index
//                        }
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle()) // Enable paging behavior
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Optional: Add page indicators
//                
//                // Show "Start Practice" button only on the last page
//                if currentPage == (viewModel.lesson?.content.count ?? 1) - 1 {
//                    Button(action: startPracticeAction) {
//                        Text("Start Practice")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 20)
//                }
//            }
//            .padding()
//            .background(Color(hex: "FFFAF3"))
//            .ignoresSafeArea()
//        }
//    }
//}
