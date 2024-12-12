//
//  LessonView.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/29/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct LessonListView: View {
    @State private var navigateToMainTab = false  // Flag to control navigation
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "FFFAF3")
                    .ignoresSafeArea()
                ScrollView {
                    NavigationLink(destination: PinyinViewP1()) {
                        VStack(alignment: .center) {
                            Image("book")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.orange)
                            Text("The Basics of Mandarin Chinese")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "554C5D"))
                            Text("review")
                                .font(.title2)
                                .foregroundColor(Color(hex: "2B5B81"))
                        }
                        .frame(maxWidth: 312, maxHeight: 240)
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#917FA2"), lineWidth: 3))
                    }

                    // Tone Lessons Section
                    Text("Tone Lessons")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .foregroundColor(Color(hex: "#554C5D"))

                    VStack(spacing: 15) {
                        // Tone 1 Lesson
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

                        // Tone 2 Lesson
                        NavigationLink(destination: Text("Lesson 2 Content")) {
                            LessonRow(
                                number: 2,
                                title: "Tone Two",
                                description: "rising tone",
                                example: "á",
                                isUnlocked: true,
                                moduleId: "foundationsIsland",
                                lessonId: "lesson2"
                            )
                        }

                        // Tone 3 Lesson
                        NavigationLink(destination: Text("Lesson 3 Content")) {
                            LessonRow(
                                number: 3,
                                title: "Tone Three",
                                description: "dip tone",
                                example: "ǎ",
                                isUnlocked: false,
                                moduleId: "foundationsIsland",
                                lessonId: "lesson3"
                            )
                        }

                        // Tone 4 Lesson
                        NavigationLink(destination: Text("Lesson 4 Content")) {
                            LessonRow(
                                number: 4,
                                title: "Tone Four",
                                description: "falling tone",
                                example: "à",
                                isUnlocked: false,
                                moduleId: "foundationsIsland",
                                lessonId: "lesson4"
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                // Trigger navigation to ModulePathView
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
        }
    }
}
