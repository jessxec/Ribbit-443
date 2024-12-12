//
//  ProgressPageView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ProgressPageView: View {
    var body: some View {
        VStack {
            Text("Daily Progress")
                .font(.title)
                .padding()

            ProgressView(value: 3, total: 5)
                .padding()
                .frame(maxWidth: 300)

            Text("Words Mastered Today: 3/5")
                .font(.headline)

            Spacer()
        }
        .padding()
        .background(.offWhite)
    }
}
