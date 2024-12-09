//
//  PinyinViewP2.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/29/24.
//

import Foundation
import SwiftUI

struct PinyinViewP2: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 2, totalPages: 6)
          
            Spacer()
          
            VStack(spacing: 10) {
                (Text("How does ") +
                 Text("Pinyin").foregroundColor(Color(hex: "B6A938")))
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
              
                Text(" work?")
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
              
                Text("Every Chinese character can be written as Pinyin, which breaks down into two parts:")
                    .font(.system(size: 18))
                    .padding(.top, 10)
                    .foregroundColor(Color(hex: "#554C5D"))
                
                VStack(alignment: .leading, spacing: 5) {
                    (Text("1. ") +
                     Text("Initials")
                        .foregroundColor(Color(hex: "3A8ACA"))
                        .fontWeight(.bold) +
                     Text(": Consonant sounds that come at the beginning of a syllable."))
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    
                    (Text("2. ") +
                     Text("Finals")
                        .foregroundColor(Color(hex: "E77661"))
                        .fontWeight(.bold) +
                     Text(": Vowel sounds that come after the initial and complete the syllable."))
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                }
                .padding(.horizontal, 20)
                
                (Text("When you put ") +
                 Text("initials")
                    .foregroundColor(Color(hex: "3A8ACA")) +
                 Text(" and ") +
                 Text("finals")
                    .foregroundColor(Color(hex: "E77661")) +
                 Text(" together, they form the Pinyin syllable, which represents the sound of a Chinese character."))
                    .font(.system(size: 18))
                    .padding(.top, 10)
                    .foregroundColor(Color(hex: "#554C5D"))
            }
            .padding(.horizontal, 30)

            Spacer()
            
            ContinueButton(destination: PinyinViewP3())
        }
        .background(Color(hex: "FFFAF3"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP2()
//    }
//}


