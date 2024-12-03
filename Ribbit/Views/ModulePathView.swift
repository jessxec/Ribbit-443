//
//  ModulePathView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ModulePathView: View {
    var body: some View {
        NavigationStack {
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
                            Text("Airport")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "#D2C0E2"))
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: Text("Cafe Module")) {
                            Text("Cafe")
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
            .navigationTitle("Module Path")
        }
    }
}
