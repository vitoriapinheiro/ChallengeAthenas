//
//  CreditsView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct CreditsView: View {
    
    let column = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ZStack {
            
            CreditsBackgroundView()
            
            HStack {
                Spacer()
                    .frame(width: 36)
                
                VStack(alignment: .center, spacing: 56) {
                    
                    VStack(alignment: .center, spacing: 48) {
                        
                            Image("gameTitleColored")
                                .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            LazyVGrid(columns: column, spacing: 32) {
                                ForEach(0..<TeamArray.teamMembers.count) { index in
                                    
                                    VStack {
                                        GridLabel(
                                            label: TeamArray.teamMembers[index].member,
                                            labelSize: 20
                                        )
                                        Spacer()
                                    }
                                    
                                    GridLabel(
                                        label: TeamArray.teamMembers[index].role,
                                        labelSize: 16
                                    )
                                    
                                }
                            }
                        }
                    }
                    
                    Text("para: \nmaricota, toy, luke, yoda, \nfofa, poppy e ode ")
                        .padding()
                        .font(.custom("xilosa", size: 20))
                        .foregroundColor(.white)
                        .lineSpacing(3)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
        }
    }
}


struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
