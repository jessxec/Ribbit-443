//
//  LessonRow.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/5/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct LessonRow: View {
    var number: Int
    var title: String
    var description: String
    var example: String
    var isUnlocked: Bool
    var moduleId: String
    var lessonId: String
    
    var body: some View {
      NavigationLink(destination: LessonView(moduleId: moduleId, lessonId: lessonId)) {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(number). \(title)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "554C5D"))
                Text(description)
                    .font(.title2)
                    .padding(.leading, 30)
                    .foregroundColor(Color(hex: "2B5B81"))
            }
            Spacer()
            Text(example)
                .font(.system(size: 38))
                .foregroundColor(Color(hex: "2B5B81"))
        }
        .padding()
        .background(isUnlocked ? Color(hex: "#FFFFFF") : Color(hex: "#D2C0E2"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "917FA2"), lineWidth: isUnlocked ? 7 : 0)
        )
        .cornerRadius(10)
        .navigationBarBackButtonHidden(true)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//      LessonRow(number: 1, title: "Tone One", description: "flat tone", example: "ā", isUnlocked: true)
//    }
//}
