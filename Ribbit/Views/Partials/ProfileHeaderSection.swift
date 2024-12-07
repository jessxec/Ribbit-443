//
//  ProfileHeaderSection.swift
//  Ribbit
//
//  Created by Tracy Yang on 12/4/24.
//
import Foundation
import SwiftUI

struct ProfileHeaderSection: View {
  var body: some View {
    HStack {
      Circle()
        .strokeBorder(Color(hex: "FF9F9F"), lineWidth: 4)
        .background(Circle().fill(Color.white))
        .frame(width: 90, height: 90)
        .overlay(Text("C").font(.largeTitle))
        .foregroundColor(Color(hex: "#554C5D"))
        .padding()
      
      Spacer()
      
      Image(systemName: "gearshape.fill")
        .foregroundColor(.gray)
        .font(.title2)
        .padding(.trailing)
    }
    .padding()
    .background(Color(hex: "D2C0E2"))
  }
}
