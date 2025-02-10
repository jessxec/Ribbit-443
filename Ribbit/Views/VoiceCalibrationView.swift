//
//  VoiceCalibrationView.swift
//  Ribbit
//
//  Created by Jack  Sun on 2/10/25.
//

import SwiftUI

struct VoiceCalibrationView: View {
    @StateObject private var audioController = WordAudioController() // Use existing controller
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Voice Calibration")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#554C5D"))
            
            Text("Record yourself speaking the following sentences to determine your pitch range. Try to speak in both your lowest and highest comfortable pitch")
                .multilineTextAlignment(.center)
                .padding()
          
            Text("'Are you being serious? I woke up this morning and realized what an amazing discovery it was! I can't believe it, but I guess it's true. Now let me take a deep breath and relax.'")
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: "#917FA2"))
                .padding()

            if let f0Range = audioController.f0Range {
                Text("Detected Pitch Range:")
                    .font(.title2)
                    .foregroundColor(.blue)
                Text("\(Int(f0Range.low)) Hz - \(Int(f0Range.high)) Hz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            } else {
                Text("No pitch range detected yet.")
                    .foregroundColor(.gray)
            }

            Button(action: {
                audioController.startVoiceCalibration()
            }) {
                HStack {
                    Image(systemName: "mic.fill")
                    Text(audioController.isCalibrating ? "Recording..." : "Start Recording")
                }
                .padding()
                .background(audioController.isCalibrating ? Color.red : Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .disabled(audioController.isCalibrating)
            
            Button(action: {
                audioController.stopVoiceCalibration()
            }) {
                HStack {
                    Image(systemName: "stop.fill")
                    Text("Stop & Analyze")
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            .disabled(!audioController.isCalibrating)
        }
        .padding()
        .background(Color(hex: "FFFAF3"))
    }
}
