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
        VStack(spacing: 20) {
            ProgressBarBackButton()
          
            VStack(alignment: .center, spacing: 10) {
                Text("The Basics of\nMandarin Chinese:")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
              
                Text("Pinyin")
                    .font(.title)
                    .foregroundColor(.purple)
                
                Text("The word pīnyīn (拼音) in Chinese literally means \"spell-sounds\".")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Text("It's the most commonly used system for transcribing or spelling out the Chinese sounds, and it uses the letters in the Latin alphabet that you are already familiar with.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            NavigationLink(destination: PinyinViewP2()) {
              Text("Continue")
                  .font(.headline)
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity)
                  .padding()
                  .background(Color.purple)
                  .cornerRadius(10)
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 170)
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea()
    }
}

struct PinyinIntroView_Previews: PreviewProvider {
    static var previews: some View {
        PinyinViewP2()
    }
}
