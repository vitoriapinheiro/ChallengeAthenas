//
//  CreditsView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct CreditsView: View {
    
    var body: some View {
        VStack {
            Spacer()
            AppButton(
                title: "Eu sou os créditos",
                action: {print("0")},
                enable: true,
                isFill: true
            )
        }
        
        
    }
}
