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
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: Text("Airport Module")) {
                        Text("Cruising through the Airport")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: Text("Cafe Module")) {
                        Text("Ordering in the Cafe")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                  
                    NavigationLink(destination: Text("Restaurant Module")) {
                        Text("Dining at the Restaurant")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                  
                    NavigationLink(destination: Text("Beach Module")) {
                        Text("Relaing Day at the beach")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                  
                    NavigationLink(destination: Text("Ocean Module")) {
                        Text("Deep in the Ocean")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#D2C0E2"))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .hideTabBar(false) // Ensure this works with your custom modifier
    }
}
