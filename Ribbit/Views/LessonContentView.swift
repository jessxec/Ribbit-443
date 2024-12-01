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

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.lesson?.title ?? "Lesson")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)

            if let content = viewModel.lesson?.content {
                ForEach(content, id: \.self) { paragraph in
                    Text(paragraph)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
            }

            Spacer()

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
    }
}
