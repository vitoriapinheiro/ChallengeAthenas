//
//  PopUpTitle.swift
//  ChallengeAthenas
//
//  Created by Bof on 24/10/22.
//

import Foundation
import SwiftUI

struct PopUpTitle: View {
    let text: String
    
    var body: some View {
        Text("\(text)")
            .foregroundColor(Color.yellow)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .font(.custom("xilosa", size: 48))
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
    }
}

struct PopUpTitle_Previews: PreviewProvider {
    static var previews: some View {
        PopUpTitle(text: "teste")
    }
}
