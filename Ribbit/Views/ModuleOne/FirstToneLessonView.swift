//
//  FirstToneLessonView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/7/24.
//
import SwiftUI

struct FirstToneLessonView: View {
    let lesson: Lesson // Use the entire Lesson object
    @Binding var showPractice: Bool // Bind to parent state
    @State private var isAtBottom = false // Track if the user has scrolled to the bottom

    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 1, totalPages: 1)
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("The First Tone：")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding(.top, 50)
                    
                    Text("一声")
                        .font(.title)
                        .foregroundColor(Color(hex: "#917FA2"))
                    
                    (Text("The First Tone is called ") +
                     Text("yī shēng (一声) ").foregroundColor(Color(hex: "B79313")) +
                     Text(", meaning the first sound."))
                        .font(.system(size: 18))
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()

                    Text(lesson.content[1])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                    
                    Text(lesson.content[2])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
     
                    Text(lesson.content[3])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                  
                    Text(lesson.content[4])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()

                    Spacer()

                    // Invisible marker at the bottom
                    GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            // Check if the bottom marker is visible
                            if geo.frame(in: .global).maxY < UIScreen.main.bounds.height {
                                isAtBottom = true
                            }
                        }
                        return Color.clear
                    }
                    .frame(height: 1) // Small frame to act as a marker
                }
                .background(Color(hex: "FFFAF3"))
                .ignoresSafeArea()
            }

            // Show the button only when the user reaches the bottom
            if isAtBottom {
                Button(action: {
                    showPractice = true // Toggle practice section
                }) {
                    Text("Continue to Practice")
                      .font(.system(size: 20))
                      .foregroundColor(.white)
                      .frame(maxWidth: .infinity)
                      .padding()
                      .background(Color(hex: "917FA2"))
                      .cornerRadius(12)

                }
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


