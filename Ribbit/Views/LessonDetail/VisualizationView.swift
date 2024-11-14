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
  @State private var highlightedStarsCount: Int = 0 // Track highlighted stars
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 300, height: 200)
        .foregroundColor(Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
          .opacity(0.15))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(audio.playingUserAudio ? borderColor : Color.white, lineWidth: 5)
        )
      
      LineGraph(dataPoints: correctVector)
        .frame(width: 280, height: 180)
      
      AnimatedGraph(dataPoints: audio.playingUserAudio ? (userVector ?? correctVector) : correctVector, progress: $audio.animationProgress, userAudio: audio.playingUserAudio)
        .frame(width: 280, height: 180)
      
      DrawStars(dataPoints: correctVector, userPitchValues: audio.pitchValues, highlightedStarsCount: $highlightedStarsCount)
        .frame(width: 280, height: 180)
    }
  }
  private var borderColor: Color {
    switch audio.collectedStars {
    case 5:
      return .green
    case 3...4:
      return .yellow
    case 0...2:
      return .red
    default:
      return .white
    }
  }
}

struct DrawStars: View {
  var dataPoints: [Double]
  var userPitchValues: [Double]
  @Binding var highlightedStarsCount: Int
  
  var body: some View {
    GeometryReader { geometry in
      let baseline = 150.0
      let maxY = 0.0
      let minY = 300.0
      let rangeY = maxY - minY
      
      ForEach(0..<5, id: \.self) { index in
        let starIndex = (dataPoints.count - 1) * index / 4
        let starX = geometry.size.width * CGFloat(index) / 4
        let adjustedValue = dataPoints[starIndex] - baseline
        let starY = geometry.size.height * (0.5 + CGFloat(adjustedValue) / CGFloat(rangeY))
        let isStarHighlighted = userPitchValues.indices.contains(starIndex) && abs(userPitchValues[starIndex] - dataPoints[starIndex]) <= 15
        
        Image(systemName: "star.fill")
          .resizable()
          .foregroundColor(isStarHighlighted ? .yellow : .white)
          .frame(width: 25, height: 25)
          .position(x: starX, y: starY)
      }
    }
  }
}




struct AnimatedGraph: View {
    var dataPoints: [Double]
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
          print("AnimatedGraph data: \(dataPoints)")
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
          Circle()
            .fill(Color.red) // Change color as desired
            .frame(width: 35, height: 35) // Circle size
            .position(x: xPosition, y: yPosition) // Position it at the last point
        }
      }
    }
}

struct LineGraph: View {
    var dataPoints: [Double]
    
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
            .stroke(Color(red: 141 / 255, green: 126 / 255, blue: 215 / 255)
                .opacity(0.58), lineWidth: 15)
          
        }
    }
}


