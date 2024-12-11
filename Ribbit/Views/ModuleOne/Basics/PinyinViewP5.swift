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
    @State private var toneSelectedStates = [false, false, false, false] // For this specific page
    @StateObject private var audioPlayer = AudioPlayer()

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                ProgressBarBackButton(currentPage: 5, totalPages: 6)

                VStack(alignment: .center) {
                    Text("Tones")
                        .font(.title)
                        .foregroundColor(Color(hex: "#917FA2"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)

                ScrollView {
                    VStack(spacing: 20) {
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
                        } else {
                            VStack(spacing: 20) {
                                (Text("Mandarin Chinese has ") +
                                 Text("four main tones. ").foregroundColor(Color(hex: "#E77661")) +
                                 Text("Each tone is essential for distinguishing word meanings."))
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "554C5D"))

                                (Text("Click on them to hear how they apply to the ") +
                                 Text("ma ").foregroundColor(Color(hex: "#E77661")) +
                                 Text("sound."))
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "554C5D"))
                            }
                            .padding(.horizontal, 30)
                        }

                        ToneCards(allTonesSelected: $allTonesSelected, toneSelectedStates: $toneSelectedStates, playSound: { tone in
                            audioPlayer.playSound(forTone: tone)

                            // Update the state for the clicked tone
                            if let index = toneSelectedStates.indices.first(where: { $0 == tone - 1 }) {
                                toneSelectedStates[index] = true
                            }

                            // Check if all tones have been clicked at least once
                            if toneSelectedStates.allSatisfy({ $0 }) {
                                allTonesSelected = true
                            }
                        })
                    }
                }

                Spacer(minLength: 20)

                // Fixed Continue Button
                if allTonesSelected {
                    ContinueButton(destination: PinyinViewP6())
                        .padding(.horizontal, 50)
                        .padding(.bottom, 50) // Ensures proper spacing at the bottom
                }
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}
