//
//  ProgressBarBackButton.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/30/24.
//

import Foundation
import SwiftUI

struct ProgressBarBackButton: View {
    @Environment(\.presentationMode) var presentationMode // To access the presentation mode
    var currentPage: Int
    var totalPages: Int
    
    var progress: Double {
        return Double(currentPage) / Double(totalPages)
    }
    var body: some View {
        VStack {
          HStack(spacing: 0.5) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                          .foregroundColor(Color(hex: "#554C5D"))
                    }
                    .foregroundColor(Color(hex: "#917FA2"))
                    .padding(.top, 50)
                }
                
              ProgressView(value: progress)
                  .tint(Color(hex: "#917FA2"))
                  .background(Color(hex: "#D2C0E2"))  
                  .frame(height: 10)               
                  .padding(.horizontal)
                  .padding(.top, 50)
            }
            .padding([.leading, .top])
        }
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//      ProgressBarBackButton(currentPage: 5, totalPages: 7)
//    }
//}
