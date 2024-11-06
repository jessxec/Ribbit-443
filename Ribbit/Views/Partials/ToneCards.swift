//
//  ToneCards.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/4/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct ToneCards: View {
    @Binding var allTonesSelected: Bool
    @Binding var toneSelectedStates: [Bool]
    var playSound: (Int) -> Void

    let tones = [
        ("mā", "妈", "mom"),
        ("má", "麻", "numb"),
        ("mǎ", "马", "horse"),
        ("mà", "骂", "curse")
    ]

    // 2-column grid
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0..<tones.count, id: \.self) { index in
                    let tone = tones[index]
                    let isSelected = toneSelectedStates[index]

                    VStack {
                        HStack {
                            Text("\(index + 1)")
                                .font(.headline)
                                .foregroundColor(isSelected ? Color(hex: "#917FA2") : .white)
                            Spacer()
                        }

                        Text(tone.0)  // Pinyin
                            .font(.title)
                            .foregroundColor(isSelected ? Color(hex: "#917FA2") : .white)
                            .multilineTextAlignment(.center)

                        Text(tone.1)  // Chinese character
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "#554C5D"))
                            .multilineTextAlignment(.center)

                        Text(tone.2)  // English meaning
                            .font(.title2)
                            .foregroundColor(isSelected ? Color(hex: "#917FA2") : .white)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width: 140, height: 130)
                    .background(isSelected ? Color.white : Color(hex: "#D2C0E2"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "917FA2"), lineWidth: isSelected ? 7 : 0)
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        toneSelectedStates[index].toggle()
                        playSound(index + 1)
                        allTonesSelected = toneSelectedStates.allSatisfy { $0 }
                    }
                }
            }
            .padding()
        }
    }
}




//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//      ToneCards()
//    }
//}
