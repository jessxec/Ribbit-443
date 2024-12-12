//
//  Pinyin.swift
//  Ribbit
//
//  Created by Tracy Yang on 10/29/24.
//
import Foundation
import SwiftUI

struct PinyinViewP1: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ProgressBarBackButton(currentPage: 1, totalPages: 6)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        Text("The Basics of\nMandarin Chinese:")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(hex: "#554C5D"))
                            .padding(.top, 50)
                        
                        Text("Pinyin")
                            .font(.title)
                            .foregroundColor(Color(hex: "#917FA2"))
                        
                        (Text("The word ") +
                         Text("pīnyīn (拼音) ").foregroundColor(Color(hex: "B79313")) +
                         Text("in Chinese literally means \"spell-sounds\"."))
                            .font(.system(size: 18))
                            .padding(.top, 50)
                            .foregroundColor(Color(hex: "#554C5D"))
                        
                        Text("It's the most commonly used system for transcribing or spelling out the Chinese sounds, and it uses the letters in the Latin alphabet that you are already familiar with.")
                            .font(.system(size: 18))
                            .padding(.top, 20)
                            .foregroundColor(Color(hex: "#554C5D"))
                                            }
                    .padding(.horizontal, 30)
                }
                
                Spacer(minLength: 20)
                
                ContinueButton(destination: PinyinViewP2())
                    .padding(.bottom, 20)
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP1()
//    }
//}
