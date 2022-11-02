//
//  vehicle.swift
//  ChallengeAthenas
//
//  Created by vivi on 31/10/22.
//

import Foundation
import SwiftUI

struct Vehicle: View {
    let rows = 5
    let collumns = 5
    let size: CGFloat = 10
    let heliblocks: [[Color]] = [[.gray, .gray, .gray, .gray, .gray],
                                 [.clear, .clear, .green, .clear, .clear],
                                 [.green, .green, .green, .green, .gray],
                                 [.clear, .clear, .green, .green, .green],
                                 [.clear, .clear, .gray, .clear, .gray]]
    
    var body: some View {
        VStack(spacing: 0){
            ForEach((0...self.rows - 1), id: \.self){ row in
                HStack(spacing: 0){
                    ForEach((0...self.collumns - 1), id: \.self){ col in
                        VStack(spacing: 0){
                            Pixel(size: self.size, color: self.heliblocks[row][col])
//                            Rectangle()
//                                .frame(width: self.size, height: self.size)
//                                .foregroundColor(self.heliblocks[row][col])
                        }
                    }
                }
            }
        }
    }
}
