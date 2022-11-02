//
//  Pixel.swift
//  ChallengeAthenas
//
//  Created by vivi on 31/10/22.
//

import Foundation
import SwiftUI

struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
