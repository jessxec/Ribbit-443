//
//  PinyinTable.swift
//  Ribbit
//
//  Created by Tracy Yang on 11/2/24.
//

import Foundation
import SwiftUI

struct PinyinTable: View {
    let columns = ["b", "p", "m", "t"]
    let rows = ["a", "i", "u", "ao"]
    let syllables: [[String]] = [
        ["ba", "pa", "ma", "ta"],
        ["bi", "pi", "mi", "ti"],
        ["bu", "pu", "mu", "tu"],
        ["bao", "pao", "mao", "tao"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header row with first letter
            HStack(spacing: 0) {
                Color.clear.frame(width: 50, height: 50) // Empty corner cell
                ForEach(columns, id: \.self) { column in
                    Text(column)
                        .font(.headline)
                        .foregroundColor(Color(hex: "554C5D"))
                        .frame(width: 80, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.gray, width: 0.5)
                }
            }
            
            // Rows with first letter and syllables
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: 0) {
                    // Row header with vowel
                    Text(rows[rowIndex])
                        .foregroundColor(Color(hex: "554C5D"))
                        .font(.headline)
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.gray, width: 0.5)
                    
                    // Syllable cells with play icon
                    ForEach(0..<columns.count, id: \.self) { columnIndex in
                        HStack {
                            Text(syllables[rowIndex][columnIndex])
                              .foregroundColor(Color(hex: "554C5D"))
                            Image(systemName: "play.fill")
                              .foregroundColor(Color(hex: "554C5D"))
                        }
                        .frame(width: 80, height: 50)
                        .border(Color.gray, width: 0.5)
                    }
                }
            }
        }
        .background(Color(hex: "FFFAF3"))
        .cornerRadius(10)
    }
}


//struct PinyinChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinyinTable()
//    }
//}

