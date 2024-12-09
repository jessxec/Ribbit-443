//
//  PinyinViewP4.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI
import Foundation
import SwiftUI

struct PinyinViewP4: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) { // Remove unnecessary spacing at the top
                ProgressBarBackButton(currentPage: 4, totalPages: 6)
                
                Text("Tones") // Place "Tones" at the very top
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    .padding(.top, 20)


                ScrollView { // Make content scrollable
                    VStack(alignment: .center, spacing: 20) { // Align all text to the left
                        Text("In Mandarin Chinese, tones are used to distinguish words from each other in the same way that consonants and vowel combinations are in English.")
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "#554C5D"))
                            .padding(20)
                      
                        (Text("Many words in Chinese are ") +
                         Text("monosyllabic")
                            .foregroundColor(Color(hex: "3A8ACA")) +
                         Text(", meaning that tones are crucial to express the word you mean."))
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "#554C5D"))
                            .padding(20)

                        (Text("To create the tones, you adjust your ") +
                        Text("pitch frequency ")
                          .foregroundColor(Color(hex: "96C7C9")) +

                        Text("just like how you would sing!"))
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "#554C5D"))
                            .padding(20)

                        // Add the image at the end of the text
                        Image("singing_frog")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 320, height: 220)
                            .padding(.vertical, 20)
                    }
                    .padding(20) // Consistent padding for all text and image
                }
                
                Spacer(minLength: 20) // Add spacing between scrollable content and button
                
                ContinueButton(destination: PinyinViewP5())
                    .padding(.bottom, 20) // Ensure proper bottom padding
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct PinyinIntroView_Previews: PreviewProvider {
     static var previews: some View {
         PinyinViewP4()
     }
 }
