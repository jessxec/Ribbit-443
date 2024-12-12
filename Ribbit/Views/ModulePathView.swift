//
//  ModulePathView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ModulePathView: View {
    var body: some View {
        VStack {
            Text("Module Path")
                .font(.title)
                .padding()

            // Example content
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: LessonListView()) {
                        Text("Foundations Island")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: AirportLessonListView()) {
                        Text("Cruising through the Airport")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: CafeLessonListView()) {
                        Text("Ordering in the Cafe")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                  
                  NavigationLink(destination: BeachLessonListView()) {
                        Text("Sunny Day at the beach")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                  
                  NavigationLink(destination: CampingLessonListView()) {
                        Text("A Camping Trip")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
        .hideTabBar(false) // Ensure this works with your custom modifier
    }
}
