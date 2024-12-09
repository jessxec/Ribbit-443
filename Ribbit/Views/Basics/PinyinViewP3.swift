//
//  PinyinViewP3.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI

struct PinyinViewP3: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 3, totalPages: 6)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Putting it")
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
                
                Text(" together")
                    .font(.title)
                    .foregroundColor(Color(hex: "917FA2"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Text("The Pinyin for the character 妈 (“mother”) is ")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "#554C5D"))
                + Text("mā")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "2B5B81"))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("• ")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    + Text("m")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "3A8ACA"))
                    + Text(" is the ")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    + Text("initial")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "3A8ACA"))
                    + Text(".")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    
                    Text("• ")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    + Text("ā")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "E77661"))
                    + Text(" is the ")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                    + Text("final")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "E77661"))
                    + Text(".")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#554C5D"))
                }
                .padding(.horizontal, 20)
                
                Text("You can reference the interactive pinyin chart below.")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "#554C5D"))
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                ScrollView {
                    PinyinTable()
                        .padding(.bottom, 20)
                    
                    ContinueButton(destination: PinyinViewP4())
                        .padding(.top, 20)
                }
            }
            .padding(.horizontal, 30)
        }
        .background(Color(hex: "FFFAF3"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP3()
//    }
//}
