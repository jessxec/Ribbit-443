//
//  HomeScreenP1.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/6/24.
//

import Foundation
import SwiftUI

struct HomeScreenP1: View {
  @Binding var showTabBar: Bool

    var body: some View {
      NavigationStack {
        ZStack {
          Color(hex: "FFFAF3")
            .ignoresSafeArea()
          
          VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 10) {
              Text("Welcome to")
                .font(.title)
                .foregroundColor(Color(hex: "#554C5D"))
              
              Text("RIBBIT")
                .font(.system(size: 70, weight: .semibold))
                .foregroundColor(Color(hex: "917FA2"))
                .padding(.bottom, 10)
              
              Text("A language learning app that helps you visualize your pronunciation")
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "554C5D"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            }
            .padding(.bottom, 20)
            
            NavigationLink(destination: LessonListView(showTabBar: $showTabBar)) {
              Text("Next")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 50)
                .background(Color(hex: "917FA2"))
                .cornerRadius(12)
            }
            .padding(.bottom, 220)
            .padding(.top, 50)
          }
        }
        .navigationBarBackButtonHidden(true)
      }
    }
}
