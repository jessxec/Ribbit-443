//
//  VisualizationView.swift
//  Ribbit
//
//  Created by Jessie Chen on 10/30/24.
//

import SwiftUI


struct VisualizationView: View {
    @ObservedObject var audio: WordAudioController
    let word: Word
    var correctVector: [Double]
    var userVector: [Double]?
    let module: String

    @State private var highlightedStarsCount: Int = 0

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 200)
                .foregroundColor(backgroundColor.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(audio.playingUserAudio ? dynamicBorderColor : Color.white, lineWidth: 5)
                )

            LineGraph(dataPoints: correctVector, color: lineColor)
                .frame(width: 280, height: 180)

            AnimatedGraph(
                dataPoints: audio.playingUserAudio ? (userVector ?? correctVector) : correctVector,
                sprite: spriteImg,
                progress: $audio.animationProgress,
                userAudio: audio.playingUserAudio
            )
            .frame(width: 280, height: 180)

            DrawStars(
                dataPoints: correctVector,
                userPitchValues: audio.pitchValues,
                highlightedStarsCount: $highlightedStarsCount
            )
            .frame(width: 280, height: 180)
        }
        .onChange(of: audio.pitchValues) { _ in
            highlightedStarsCount = calculateStarsLitUp()
        }
        .onAppear {
            highlightedStarsCount = calculateStarsLitUp()
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

    private var dynamicBorderColor: Color {
        switch highlightedStarsCount {
        case 5: return .green
        case 3...4: return .yellow
        case 1...2: return .red
        default: return .white
        }
    }

    private var backgroundColor: Color {
        switch module {
        case "foundationsIsland", "airportModule":
            return Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
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

    private var spriteImg: String {
        switch module {
        case "foundationsIsland": return "lotus"
        case "airportModule": return "luggage"
        case "cafeModule": return "cake"
        case "campingModule": return "dragonfly"
        case "beachModule": return "shell"
        default: return "lotus"
        }
    }
}


struct DrawStars: View {
    var dataPoints: [Double]
    var userPitchValues: [Double]
    @Binding var highlightedStarsCount: Int

    // Constants
    let starCount = 5
    let tolerance: Double = 15.0
    let baseline: Double = 150.0
    let minY: Double = 300.0
    let maxY: Double = 0.0

    var body: some View {
        GeometryReader { geometry in
            // Compute the star positions and highlight statuses using a helper function.
            let starInfos = computeStarInfos(geometry: geometry)

            // Update highlightedStarsCount when the view appears or when userPitchValues change.
            Color.clear
                .onAppear {
                    highlightedStarsCount = starInfos.filter { $0.highlighted }.count
                }
                .onChange(of: userPitchValues) { _ in
                    highlightedStarsCount = starInfos.filter { $0.highlighted }.count
                }

            // Render the stars.
            ForEach(0..<starInfos.count, id: \.self) { i in
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(starInfos[i].highlighted ? .yellow : .white)
                    .frame(width: 25, height: 25)
                    .position(x: starInfos[i].x, y: starInfos[i].y)
            }
        }
    }

    /// Computes the positions and highlight status of stars given the available geometry.
    func computeStarInfos(geometry: GeometryProxy) -> [StarInfo] {
        let rangeY = maxY - minY
        var infos: [StarInfo] = []
        for i in 0..<starCount {
            let starIndex = (dataPoints.count - 1) * i / (starCount - 1)
            let starX = geometry.size.width * CGFloat(i) / CGFloat(starCount - 1)
            let adjustedValue = dataPoints[starIndex] - baseline
            let starY = geometry.size.height * (0.5 + CGFloat(adjustedValue) / CGFloat(rangeY))
            
            // Map the star index from dataPoints to a corresponding index in userPitchValues
            let userIndex: Int
            if userPitchValues.isEmpty {
                userIndex = 0
            } else {
                userIndex = Int(Double(userPitchValues.count - 1) * Double(starIndex) / Double(dataPoints.count - 1))
            }
            
            let highlighted = (!userPitchValues.isEmpty) &&
                (abs(userPitchValues[userIndex] - dataPoints[starIndex]) <= tolerance)
            
            infos.append(StarInfo(x: starX, y: starY, highlighted: highlighted))
        }
        return infos
    }

    struct StarInfo {
        let x: CGFloat
        let y: CGFloat
        let highlighted: Bool
    }
}


struct AnimatedGraph: View {
    var dataPoints: [Double]
    var sprite: String
    @Binding var progress: Double // Use progress to control drawing
    var userAudio: Bool
  
    var body: some View {
      GeometryReader { geometry in
        let maxY = 0.0
        let minY = 300.0
        let baseline = 150.0
        // Create the path
        Path { path in
          let visiblePoints = Int(progress * Double(dataPoints.count)) // Calculate visible points based on progress
          for index in dataPoints.indices.prefix(visiblePoints) {
            let xPosition = geometry.size.width * CGFloat(index) / CGFloat(dataPoints.count - 1)
            
            // Adjust yPosition based on the fixed 0-300 range and baseline of 150
            let adjustedValue = dataPoints[index] - baseline
            let yPosition = geometry.size.height * (0.5 + CGFloat(adjustedValue) / CGFloat(maxY - minY))
            
            if index == 0 {
              path.move(to: CGPoint(x: xPosition, y: yPosition))
            } else {
              path.addLine(to: CGPoint(x: xPosition, y: yPosition))
            }
          }
        }
        .stroke(userAudio ? Color(hex:"#3847A2").opacity(0.58) : Color(red: 245/255, green: 255/255, blue: 201/255)
          .opacity(0.58), lineWidth: 8)
        
        // Calculate the last point's position for the circle
        if !dataPoints.isEmpty {
          let lastIndex = min(dataPoints.count - 1, Int(progress * Double(dataPoints.count - 1)))
          let xPosition = geometry.size.width * CGFloat(lastIndex) / CGFloat(dataPoints.count - 1)
          let adjustedValue = dataPoints[lastIndex] - baseline
          let yPosition = geometry.size.height * (0.5 + CGFloat(adjustedValue) / CGFloat(maxY - minY))
          
          // Draw the circle at the last point
          Image("\(sprite)")
            .position(x: xPosition, y: yPosition) // Position it at the last point
        }
      }
    }
}

struct LineGraph: View {
    var dataPoints: [Double]
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let maxY = 0.0
            let minY = 300.0
          let baseline = 150.0
            
            Path { path in
                // Calculate the x and y positions for each data point
              print("LinearGraph data: \(dataPoints)")
                for index in dataPoints.indices {
                    let xPosition = geometry.size.width * CGFloat(index) / CGFloat(dataPoints.count - 1)
                    let adjustedValue = dataPoints[index] - baseline
                    let yPosition = geometry.size.height * (0.5 + CGFloat(adjustedValue) / CGFloat(maxY - minY))
                  
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            }
            .stroke(color
                .opacity(0.58), lineWidth: 8)
          
        }
    }
}


