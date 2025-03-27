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
                        .stroke(audio.playingUserAudio ? dynamicBorderColor : Color.white, lineWidth: 5)
                        .id(highlightedStarsCount)
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
        .onChange(of: audio.pitchValues) { _ in
            highlightedStarsCount = calculateStarsLitUp()
        }
        .onAppear {
            highlightedStarsCount = calculateStarsLitUp()
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
    private var dynamicBorderColor: Color {
    switch highlightedStarsCount {
    case 5:
        return .green
    case 3...4:
        return .yellow
    case 1...2:
        return .red
    default:
        return .white
    }
}
  private func calculateStarsLitUp() -> Int {
      let starCount = 5
      let tolerance: Double = 15.0

      guard !audio.pitchValues.isEmpty else { return 0 }

      var count = 0
      for i in 0..<starCount {
          let starIndex = (correctVector.count - 1) * i / (starCount - 1)
          let targetPitch = correctVector[starIndex]

          let userIndex = Int(Double(audio.pitchValues.count - 1) * Double(starIndex) / Double(correctVector.count - 1))
          let userPitch = audio.pitchValues[userIndex]

          if abs(userPitch - targetPitch) <= tolerance {
              count += 1
          }
      }
      return count
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
}
