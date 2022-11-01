//
//  CreditsBackgroundImage.swift
//  ChallengeAthenas
//
//  Created by mvbsa on 31/10/22.
//

import Foundation
import SwiftUI

struct BackgroundImage: View {
    
    var imageName: String
    var imageAngle: CGFloat
    var frameWidth: CGFloat
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(imageName)
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: imageAngle))
            Spacer()
                .frame(width: frameWidth)
        }
    }
}
