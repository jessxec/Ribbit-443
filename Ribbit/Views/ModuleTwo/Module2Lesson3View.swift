//
//  Module2Lesson3View.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/12/24.
//


import SwiftUI

import SwiftUI

struct Module2Lesson3View: View {
    let lesson: Lesson
    @Binding var showPractice: Bool
    @State private var isAtBottom = false
    @EnvironmentObject var badgeViewModel: BadgeViewModel // Use environment object here

    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 1, totalPages: 1)
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("Nasal Complex Vowels:")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding(.top, 50)
                  
                    Text(lesson.content[0])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                    
                    Text(lesson.content[1])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()

                    Spacer()

                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            if geo.frame(in: .global).maxY < UIScreen.main.bounds.height {
                                isAtBottom = true
                            }
                        }
                        return Color.clear
                    }
                    .frame(height: 1)
                }
                .background(Color(hex: "FFFAF3"))
                .ignoresSafeArea()
            }

            if isAtBottom {
                Button(action: {
                    showPractice = true
                }) {
                    Text("Continue to Practice")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "917FA2"))
                        .cornerRadius(12)
                }
                .fullScreenCover(isPresented: $showPractice) {
                    LessonCompleteView(moduleId: "airportModule", lessonId: "lesson3")
                        .environmentObject(badgeViewModel) // Pass badgeViewModel here
                }
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
