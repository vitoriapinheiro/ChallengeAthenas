//
//  AppInitalSecondaryButton.swift
//  ChallengeAthenas
//
//  Created by thaxz on 27/10/22.
//

import Foundation
import SwiftUI

struct AppInitialButton: View {
    let title: String
    let nextView: () -> AnyView
    let isSecondary: Bool
    
    var body: some View {
        NavigationLink(
            destination: nextView(),
            
            label: {
                
                ZStack {
                    
                   
                    
                    Image(isSecondary ? "secondaryButton" : "primaryButton")
                        .frame(width:  isSecondary ? 171 : 358, height: 55)
                    
                    Text(title)
                        .font(.custom("xilosa", size: 20))
                        .foregroundColor(isSecondary ? Color("orange700") : Color.white)
                
                }
                

            }
        )
    }
}
