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

    var body: some View {
        VStack(spacing: 20) {
            ProgressBarBackButton(currentPage: 1, totalPages: 1)
            
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
                
                Text(lesson.content[2])
                .padding(.top, 50)
                .foregroundColor(Color(hex: "#554C5D"))
                .padding()
              
                Spacer()
                
                Button(action: {
                    showPractice = true // Toggle practice section
                }) {
                    Text("Continue to Practice")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .background(Color(hex: "FFFAF3"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}
