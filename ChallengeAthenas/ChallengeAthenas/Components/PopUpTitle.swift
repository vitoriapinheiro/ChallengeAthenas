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
    var colorPick: Bool // 0 if yellow, 1 if red
    
    var body: some View {
        Text("\(text.uppercased())")
            .foregroundColor(colorPick ? Color.red : Color.yellow)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .font(.custom("xilosa", size: 48))
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
    }
}

struct PopUpTitle_Previews: PreviewProvider {
    static var previews: some View {
        PopUpTitle(text: "teste", colorPick: true)
    }
}
