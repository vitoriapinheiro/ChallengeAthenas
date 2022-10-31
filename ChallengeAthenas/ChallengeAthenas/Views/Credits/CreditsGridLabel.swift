//
//  CreditsGridLabel.swift
//  ChallengeAthenas
//
//  Created by mvbsa on 31/10/22.
//

import Foundation
import SwiftUI

struct GridLabel: View {
    
    var label: String
    var labelSize: CGFloat
    
    var body: some View {
        
        HStack {
            Text(label)
                .font(.custom("xilosa", size: (labelSize)))
                .foregroundColor(.white)
            
            Spacer()
        }
    }
}
