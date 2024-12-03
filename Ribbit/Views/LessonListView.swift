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
  
    @Environment(\.presentationMode) var presentationMode // To handle manual back navigation
  
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "FFFAF3")
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        // Foundations Section
                        Text("Foundations")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: "#554C5D"))
                        
                        NavigationLink(destination: PinyinViewP1()) {
                            VStack(alignment: .center) {
                                Image(systemName: "book.fill")
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
                        .navigationBarBackButtonHidden(true)
    
                        // Tone Lessons Section
                        Text("Tone Lessons")
                          .font(.title)
                          .fontWeight(.semibold)
                          .padding(.leading)
                          .padding(.bottom, 10)
                          .padding(.top, 10)
                          .foregroundColor(Color(hex: "#554C5D"))
                        
                        VStack(spacing: 15) {
                            LessonRow(
                                number: 1,
                                title: "Tone One",
                                description: "flat tone",
                                example: "ā",
                                isUnlocked: true, // Update with actual unlock logic
                                moduleId: "foundationsIsland",
                                lessonId: "lesson1"
                            )
                            LessonRow(
                                number: 2,
                                title: "Tone Two",
                                description: "rising tone",
                                example: "á",
                                isUnlocked: true, // Update with actual unlock logic
                                moduleId: "foundationsIsland",
                                lessonId: "lesson2"
                            )
                            LessonRow(
                                number: 3,
                                title: "Tone Three",
                                description: "dip tone",
                                example: "ǎ",
                                isUnlocked: false, // Update with actual unlock logic
                                moduleId: "foundationsIsland",
                                lessonId: "lesson2"
                            )
                            LessonRow(
                                number: 4,
                                title: "Tone Four",
                                description: "falling tone",
                                example: "à",
                                isUnlocked: false, // Update with actual unlock logic
                                moduleId: "foundationsIsland",
                                lessonId: "lesson2"
                            )
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss() // Navigate back
                }) {
                  HStack(spacing: 2) {
                      Image(systemName: "chevron.left")
                      Text("Back")
                        .foregroundColor(Color(hex: "#554C5D"))
                  }
                  .foregroundColor(Color(hex: "#917FA2"))
                })
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//      LessonListView()
//    }
//}
