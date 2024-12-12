//
//  ModulePathView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ModulePathView: View {

    var body: some View {
        ZStack {
            // Background color or image behind the ScrollView
          Image("backgroundGradient")
          .resizable()
          .edgesIgnoringSafeArea(.all)
          

            // ScrollView with content
            ScrollView(.vertical, showsIndicators: false) {
              ZStack {
                VStack {
                  // Spacer to push the image to the bottom initially
                  Spacer()
                  
                  // The long image
                  Image("map") // Replace with your image name
                    .resizable()
                    .scaledToFill() // Make sure the image fills the available space while maintaining aspect ratio
                    .frame(width: UIScreen.main.bounds.width) // Fill the full width of the screen
                    .clipped() // Ensure any overflow is clipped
                    .edgesIgnoringSafeArea(.bottom) // Let the image extend below the safe area if needed
                }
                NavigationLink(destination: LessonListView()) {
                    Text("Foundations Island")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.mainDark)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .background(.offWhite)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightTeal, lineWidth: 5)
                        )
                }
                .padding(.bottom, 220)
                .padding(.top, 50)
                .position(x: UIScreen.main.bounds.width/2 + 60, y: 840)
                NavigationLink(destination: AirportLessonListView()) {
                    Text("Airport")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.mainDark)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .background(.offWhite)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightTeal, lineWidth: 5)
                        )
                }
                .padding(.bottom, 220)
                .padding(.top, 50)
                .position(x: UIScreen.main.bounds.width/2 + 120, y: 610)
                
                
                NavigationLink(destination: AirportLessonListView()) {
                    Text("Camping")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.mainDark)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .background(.offWhite)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightTeal, lineWidth: 5)
                        )
                }
                .padding(.bottom, 220)
                .padding(.top, 50)
                .position(x: UIScreen.main.bounds.width/2 + 90 , y: 180)
                
                NavigationLink(destination: AirportLessonListView()) {
                    Text("Beach")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.mainDark)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .background(.offWhite)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightTeal, lineWidth: 5)
                        )
                }
                .padding(.bottom, 220)
                .padding(.top, 50)
                .position(x: UIScreen.main.bounds.width/2 - 15 , y: 550)

                NavigationLink(destination: AirportLessonListView()) {
                    Text("Cafe")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.mainDark)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .background(.offWhite)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.lightTeal, lineWidth: 5)
                        )
                }
                .padding(.bottom, 220)
                .padding(.top, 50)
                .position(x: UIScreen.main.bounds.width/2 - 70 , y: 330)
                
              }
            }
            .edgesIgnoringSafeArea(.all)
            .defaultScrollAnchor(.bottom)
          
           
        }
        .edgesIgnoringSafeArea(.all) // Extend the background to fill the entire screen
    }
}

struct ScrollableImageView_Previews: PreviewProvider {
    static var previews: some View {
        ModulePathView()
    }
}
