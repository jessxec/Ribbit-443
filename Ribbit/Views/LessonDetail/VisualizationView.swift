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
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 300, height: 200)
        .foregroundColor(Color(red: 94 / 255, green: 202 / 255, blue: 206 / 255)
          .opacity(0.15))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.white, lineWidth: 5)
        )
      LineGraph(dataPoints: correctVector)
        .frame(width: 280, height: 180)
      AnimatedGraph(dataPoints: audio.playingUserAudio ? (userVector ?? correctVector) : correctVector, progress: $audio.animationProgress)
        .frame(width: 280, height: 180)
      DrawStars(dataPoints: correctVector)
        .frame(width: 280, height: 180)
    }
  }
}

struct DrawStars: View {
  // add 5 stars evenly on linegraph
  var dataPoints: [Double]

      var body: some View {
          GeometryReader { geometry in
            let maxY = 0.0
            let minY = 300.0
              let rangeY = maxY - minY

              ForEach(0..<5, id: \.self) { index in
                  // Calculate the position for the stars
                  let starIndex = (dataPoints.count - 1) * index / 4 // 4 for 5 stars
                  let starX = geometry.size.width * CGFloat(index) / 4 // Evenly distribute stars
                  let starY = geometry.size.height * CGFloat(1 - (dataPoints[starIndex] - minY) / rangeY)

                  Image(systemName: "star.fill")
                  .resizable()
                  .foregroundStyle(.white)
                      .frame(width: 25, height: 25)
                      .position(x: starX, y: starY)
              }
          }
      }
}

struct AnimatedGraph: View {
    var dataPoints: [Double]
    @Binding var progress: Double // Use progress to control drawing
    
    var body: some View {
        ZStack {
          Text("\(progress)")}
        GeometryReader { geometry in
            let maxY = 0.0
            let minY = 300.0
            let rangeY = maxY - minY
            
            // Create the path
            Path { path in
                let visiblePoints = Int(progress * Double(dataPoints.count)) // Calculate visible points based on progress
                
                for index in dataPoints.indices.prefix(visiblePoints) {
                    print(progress)
                    let xPosition = geometry.size.width * CGFloat(index) / CGFloat(dataPoints.count - 1)
                    let yPosition = geometry.size.height * CGFloat(1 - (dataPoints[index] - minY) / rangeY)
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            }
            .stroke(Color(red: 245/255, green: 255/255, blue: 201/255)
                        .opacity(0.58), lineWidth: 20)

            // Calculate the last point's position for the circle
            if !dataPoints.isEmpty {
                let lastIndex = min(dataPoints.count - 1, Int(progress * Double(dataPoints.count - 1)))
                let lastXPosition = geometry.size.width * CGFloat(lastIndex) / CGFloat(dataPoints.count - 1)
                let lastYPosition = geometry.size.height * CGFloat(1 - (dataPoints[lastIndex] - minY) / rangeY)

                // Draw the circle at the last point
                Circle()
                    .fill(Color.red) // Change color as desired
                    .frame(width: 35, height: 35) // Circle size
                    .position(x: lastXPosition, y: lastYPosition) // Position it at the last point
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
            let rangeY = maxY - minY
            
            Path { path in
                // Calculate the x and y positions for each data point
                for index in dataPoints.indices {
                    let xPosition = geometry.size.width * CGFloat(index) / CGFloat(dataPoints.count - 1)
                    let yPosition = geometry.size.height * CGFloat(1 - (dataPoints[index] - minY) / rangeY)
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            }
            .stroke(Color(red: 141 / 255, green: 126 / 255, blue: 215 / 255)
                .opacity(0.58), lineWidth: 20)
          
        }
    }
}


