//
//  HomeScreenP1.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/6/24.
//

import Foundation
import SwiftUI

struct HomeScreenP1: View {
    var body: some View {
        ZStack {
            // Make sure the image scales to fill the entire screen
            Image("welcome")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // NavigationLink to go to the next screen
            NavigationLink(destination: MainTabView()) {
                Text("Next")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.mainDark)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 40)
                    .background(.offWhite)
                    .cornerRadius(12)
            }
            .padding(.bottom, 220)
            .padding(.top, 50)
            .position(x: UIScreen.main.bounds.width / 2, y: 720)
            .navigationBarBackButtonHidden(true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full screen frame
    }
}
