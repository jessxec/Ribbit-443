//
//  ContinueButton.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI

struct ContinueButton<Destination: View>: View {
  let destination: Destination
  
  var body: some View {
          NavigationLink(destination: destination) {
              Text("Continue")
                  .font(.system(size: 20))
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity)
                  .padding()
                  .background(Color(hex: "917FA2"))
                  .cornerRadius(12)
          }
          .padding(.horizontal, 50)
          .padding(.bottom, 50)
  }
}

