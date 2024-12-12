//
//  Module5Lesson3View.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/12/24.
//



import SwiftUI

struct Module5Lesson3View: View {
    let lesson: Lesson // Use the entire Lesson object
    @Binding var showPractice: Bool // Bind to parent state
    @State private var isAtBottom = false // Track if the user has scrolled to the bottom

    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 1, totalPages: 1)
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                  Text("Siblants are Sizzling!")
                      .font(.title)
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(hex: "#554C5D"))
                      .padding(.top, 50)
                  
                    Text(lesson.content[0])
                        .padding(.top, 50)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                    
                    Text(lesson.content[1])
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



