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
    let module: Module
    
    var body: some View {
      NavigationView {
          List {
//              ForEach(lesson) { lesson in
//                  LessonView(lesson: lesson)
              }
          }
          .navigationBarTitle("Tone Lessons")
      }
}
