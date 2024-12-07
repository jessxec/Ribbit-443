//
//  PinyinViewP6.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI

struct PinyinViewP6: View {
    @Binding var showTabBar: Bool
    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 6, totalPages: 6)
            Spacer()
            VStack(alignment: .center, spacing: 10) {
              Text("Tones")
                    .font(.title)
                    .foregroundColor(Color(hex: "#917FA2"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
              
                Text("Correctly pronouncing the tones is very important! You do not want to accidentally call your mom (mā) a horse (mǎ)!")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "554C5D"))
                    .padding(.bottom, 50)

                Text("Let start practicing the tones so you can become an expert!")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "554C5D"))
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
//            ContinueButton(destination: ReviewComplete())
              ContinueButton(destination: LessonListView(showTabBar: $showTabBar))
        }
        .background(Color(hex: "FFFAF3"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP6()
//    }
//}
