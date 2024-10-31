//
//  ProgressBarBackButton.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/30/24.
//

import Foundation
import SwiftUI

struct ProgressBarBackButton: View {
  var body: some View {
    VStack() {
      HStack {
        Button(action: {
        }) {
          HStack(spacing: 5) {
            Image(systemName: "arrow.left")
            Text("Back")
          }
          .foregroundColor(.purple)
          .padding(.top, 50)
        }
        ProgressView(value: 0.5) // Can adjust value (how to automate?)
          .tint(.purple)
          .padding(.horizontal)
          .padding(.top, 50)
      }
      .padding([.leading, .top])
    }
  }
}
