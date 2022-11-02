//
//  CreditsButton.swift
//  ChallengeAthenas
//
//  Created by thaxz on 27/10/22.
//

import Foundation
import SwiftUI

struct CreditsButton: View {
    let nextView: () -> AnyView
    
    
    var body: some View {
        NavigationLink(
            destination: nextView(),
            
            label: {
                
                    Text("créditos")
                        .font(.custom("xilo-sans", size: 20))
                        .frame(width: 358, height: 55)
                        .padding(.horizontal, 16)
                        .foregroundColor(Color.white)
                        .underline()
                

            }
        )
    }
}
