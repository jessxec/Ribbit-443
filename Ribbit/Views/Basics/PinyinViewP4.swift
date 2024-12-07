//
//  PinyinViewP4.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI

struct PinyinViewP4: View {
    @Binding var showTabBar: Bool
    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 4, totalPages: 6)
            Spacer()
            VStack(alignment: .center, spacing: 10) {
              Text("Tones")
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
              
                Text("In Mandarin Chinese, tones are used to distinguish words from each other in the same way that constants and vowel combinations are in English.")
                    .font(.system(size: 18))
                    .padding(.bottom, 50)

                Text("Many words in Chinese are monosyllabic, meaning that tones are crucial to express the word you mean.")
                    .font(.system(size: 18))
                    .padding(.bottom, 50)
              
              Text("To create the tones, you adjust your pitch frequency just like how you would sing!")
                    .font(.system(size: 18))
            }
            .foregroundColor(Color(hex: "#554C5D"))
            .padding(.horizontal, 30)
            
            Spacer()
            
            ContinueButton(destination: PinyinViewP5(showTabBar: $showTabBar))
        }
        .background(Color(hex: "FFFAF3"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP4()
//    }
//}
