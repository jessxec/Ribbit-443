//
//  StaticVisualizationView.swift
//  Ribbit
//
//  Created by Jack  Sun on 2/13/25.
//

import SwiftUI

struct StaticVisualizationView: View {
    @ObservedObject var audio: WordAudioController
    let word: Word
    var correctVector: [Double]
    var userVector: [Double]?
    let module: String

    @State private var highlightedStarsCount: Int = 0 // Track highlighted stars

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 200)
                .foregroundColor(backgroundColor.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(audio.playingUserAudio ? borderColor : Color.white, lineWidth: 5)
                )

            // Draw the correct pitch line (No animation)
            LineGraph(dataPoints: correctVector, color: lineColor)
                .frame(width: 280, height: 180)

            // Draw user pitch if available (No animation)
            if let userVector = userVector {
                LineGraph(dataPoints: userVector, color: .blue)
                    .frame(width: 280, height: 180)
            }

            // Draw stars on the graph
            DrawStars(dataPoints: correctVector, userPitchValues: audio.pitchValues, highlightedStarsCount: $highlightedStarsCount)
                .frame(width: 280, height: 180)
        }
    }

    private var backgroundColor: Color {
        switch module {
        case "foundationsIsland": return Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
        case "airportModule": return Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
        case "cafeModule": return .paleYellow
        case "campingModule": return .paleGreen
        case "beachModule": return .paleTeal
        default: return Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
        }
    }

    private var lineColor: Color {
        switch module {
        case "foundationsIsland": return Color(red: 141 / 255, green: 126 / 255, blue: 215 / 255)
        case "airportModule": return .darkBlue
        case "cafeModule": return .darkRed
        case "campingModule": return .darkGreen
        case "beachModule": return .darkTeal
        default: return Color(red: 141 / 255, green: 126 / 255, blue: 215 / 255)
        }
    }

    private var borderColor: Color {
        switch audio.collectedStars {
        case 5: return .green
        case 3...4: return .yellow
        case 0...2: return .red
        default: return .white
        }
    }
}
