//
//  AirportLessonListView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/9/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct AirportLessonListView: View {
  @Environment(\.presentationMode) var presentationMode // To handle manual back navigation
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "FFFAF3")
          .ignoresSafeArea()
        ScrollView {
          NavigationLink(destination: PinyinViewP1()) {
              VStack(alignment: .center) {
                  Image(systemName: "book.fill")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 100, height: 100)
                      .foregroundColor(.orange)
                  Text("Foundations Island")
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

            Text("Cruising through the Airport ")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.leading)
            .padding(.bottom, 10)
            .padding(.top, 10)
            .foregroundColor(Color(hex: "#554C5D"))
          
          VStack(spacing: 15) {
            // Tone 1 Lesson
            NavigationLink(destination: Text("Lesson 1 Content")
            ) {
              LessonRow(
                number: 1,
                title: "Complex Vowels I.",
                description: "ai, ei, ao, ou",
                example: "海",
                isUnlocked: true,
                moduleId: "airportModule",
                lessonId: "lesson1"
              )
            }
            
            // Tone 2 Lesson
            NavigationLink(destination: Text("Lesson 2 Content")
            ) {
              LessonRow(
                number: 2,
                title: "Complex Vowels II.",
                description: "an, en, in, un",
                example: "家",
                isUnlocked: true,
                moduleId: "airportModule",
                lessonId: "lesson2"
              )
            }
            
            // Tone 3 Lesson
            NavigationLink(destination: Text("Lesson 3 Content")
            ) {
              LessonRow(
                number: 3,
                title: "Nasals Finals",
                description: "jing, tang, fang",
                example: "北京",
                isUnlocked: false,
                moduleId: "airportModule",
                lessonId: "lesson3"
              )
            }
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
    }.hideTabBar(true)
  }
}
