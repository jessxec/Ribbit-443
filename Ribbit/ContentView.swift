//
//  ContentView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      LessonView(moduleId: "foundationsIsland", lessonId: "lesson1")
    }
}

#Preview {
  LessonView(moduleId: "foundationsIsland", lessonId: "lesson1")}
