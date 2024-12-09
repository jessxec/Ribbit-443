//
//  PinyinViewP5.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct PinyinViewP5: View {
    @State private var allTonesSelected = false
    @State private var toneSelectedStates = [false, false, false, false] // For this specfic page
    @StateObject private var audioPlayer = AudioPlayer()


    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                ProgressBarBackButton(currentPage: 5, totalPages: 6)

                Spacer()

                VStack(alignment: .center) {
                    Text("Tones")
                        .font(.title)
                        .foregroundColor(Color(hex: "#917FA2"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)

                ScrollView {
                    if allTonesSelected {
                        VStack(alignment: .center, spacing: 10) {
                            Text("Did you notice how each tone represents different characters?")
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "554C5D"))
                                .padding(.bottom, 10)

                            (Text("They all share the ") +
                             Text("ma ").foregroundColor(Color(hex: "E77661")) +
                             Text("sound, but the tone variation makes them into completely different words!"))
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "554C5D"))
                        }
                        .padding(.horizontal, 30)

                        ToneCards(allTonesSelected: $allTonesSelected, toneSelectedStates: $toneSelectedStates, playSound: { tone in
                            audioPlayer.playSound(forTone: tone)
                        })

                        ContinueButton(destination: PinyinViewP6())
                    } else {
                        VStack(spacing: 20) {
                            (Text("Mandarin Chinese has ") +
                             Text("four main tones. ").foregroundColor(Color(hex: "#E77661")) + Text("Each tone is essential for distinguishing word meanings."))
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "#554C5D"))

                            (Text("Click on them to hear how they apply to the ") +
                             Text("ma ").foregroundColor(Color(hex: "#E77661")) +
                             Text("sound."))
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "#554C5D"))
                        }
                        .padding(.horizontal, 30)

                        ToneCards(allTonesSelected: $allTonesSelected, toneSelectedStates: $toneSelectedStates, playSound: { tone in
                            audioPlayer.playSound(forTone: tone)
                        })
                    }
                }
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}


//struct PinyinIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinViewP5()
//    }
//}
