//
//  FirstToneLessonView.swift
//  Ribbit
//
//  Created by Jack  Sun on 12/6/24.
//
import SwiftUI
struct FirstToneLessonView: View {
    let content: [String]
    @Binding var showPractice: Bool // Control practice section visibility

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
                
                if content.indices.contains(1) {
                    Text(content[1])
                        .font(.system(size: 18))
                        .padding(.top, 20)
                        .foregroundColor(Color(hex: "#554C5D"))
                        .padding()
                } else {
                    Text("Content not available")
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                        .padding()
                }
                
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

//struct ToneOneView_Previews: PreviewProvider {
//  static var previews: some View {
//    FirstToneLessonView(content: [""])
//  }
//}
