//
//  BackButton.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/4/24.
//
import Foundation
import SwiftUI

struct BackButton: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button(action: {
      presentationMode.wrappedValue.dismiss()
    }) {
      HStack(spacing: 2) {
        Image(systemName: "chevron.left")
        Text("Back")
          .foregroundColor(Color(hex: "#554C5D"))
      }
      .foregroundColor(Color(hex: "#917FA2"))
      .padding(.top, 20)
    }
  }
}
