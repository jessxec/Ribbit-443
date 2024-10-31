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
            ProgressBarBackButton()
            
            VStack(alignment: .center, spacing: 10) {
                Text("How does Pinyin work?")
                    .font(.title2)
                    .foregroundColor(.purple)
                    .multilineTextAlignment(.center)
                
                Text("Every Chinese character can be transcribed into Pinyin, which breaks down into two parts:")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("1. **Initials**: Consonant sounds that come at the beginning of a syllable.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    
                    Text("2. **Finals**: Vowel sounds that come after the initial and complete the syllable.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 20)
                
                Text("When you put initials and finals together, they form the Pinyin syllable, which represents the sound of a Chinese character.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            Button(action: {
                // Add continue action here
            }) {
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
