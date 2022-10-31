//
//  CreditsBackground.swift
//  ChallengeAthenas
//
//  Created by mvbsa on 31/10/22.
//

import Foundation
import SwiftUI

struct CreditsBackgroundView: View {
    
    let bottomGradient = Color("black80")
    let topGradient = Color("orange900")
    
    var backgroundGradient: LinearGradient?
    
    init() {
        self.backgroundGradient = LinearGradient(
            colors: [self.bottomGradient, self.topGradient],
            startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        
        backgroundGradient
            .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
                .frame(height: 29)
            
            BackgroundImage(
                imageName: "luaPreta",
                imageAngle: 2,
                frameWidth: 8
            )
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
            
            BackgroundImage(
                imageName: "cactos",
                imageAngle: 0,
                frameWidth: 290
            )

        }
        .edgesIgnoringSafeArea(.all)
        
        VStack {
            Spacer()
            
            BackgroundImage(
                imageName: "fogueira",
                imageAngle: 0,
                frameWidth: 0
            )
            
        }
        .edgesIgnoringSafeArea(.all)
        .offset(x: 24, y: 56)
        
    }
}
