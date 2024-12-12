//
//  CampingLessonList.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/12/24.
//


import Foundation
import SwiftUI
import FirebaseFirestore

struct CampingLessonListView: View {
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

            Text("A Camping Trip ")
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
                title: "Tone Sandi",
                description: "nǐ hǎo",
                example: "咖啡",
                isUnlocked: true,
                moduleId: "campingModule",
                lessonId: "lesson1"
              )
            }
            
            // Tone 2 Lesson
            NavigationLink(destination: Text("Lesson 2 Content")
            ) {
              LessonRow(
                number: 2,
                title: "Yī",
                description: "yí yàng",
                example: "蛋糕",
                isUnlocked: true,
                moduleId: "campingModule",
                lessonId: "lesson2"
              )
            }
            
            // Tone 3 Lesson
            NavigationLink(destination: Text("Lesson 3 Content")
            ) {
              LessonRow(
                number: 3,
                title: "bù!",
                description: "bú shì",
                example: "不是",
                isUnlocked: false,
                moduleId: "campingModule",
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
