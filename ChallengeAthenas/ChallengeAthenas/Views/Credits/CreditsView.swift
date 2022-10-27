//
//  CreditsView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct CreditsView: View {
    
    let bottomGradient = Color("bottomGradient")
    let topGradient = Color("topGradient")
    
    var backgroundGradient: LinearGradient?
    
    let column = [
        GridItem(),
        GridItem()
    ]
    
    init() {
        self.backgroundGradient = LinearGradient(
            colors: [self.bottomGradient, self.topGradient],
            startPoint: .bottom, endPoint: .top)
    }
    
    var body: some View {
        ZStack {
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 29)
                HStack {
                    Spacer()
                    Image("luaPreta")
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(Angle(degrees: 2))
                    Spacer()
                        .frame(width: 8)
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("cactos")
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                        .frame(width: 290)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("fogueira")
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                        .frame(width: 0)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .offset(x: 24, y: 56)
            
            HStack {
                Spacer()
                    .frame(width: 36)
                
                VStack(spacing: 64) {
                    
                    VStack(spacing: 48) {
                        
                        Image("gameTitleColored")
                            .aspectRatio(contentMode: .fit)
                        
                        HStack {
                            LazyVGrid(columns: column, spacing: 32) {
                                ForEach(0..<TeamArray.teamMembers.count) { index in
                                    
                                    VStack {
                                        
                                        HStack {
                                            Text(TeamArray.teamMembers[index].member)
                                                .font(.system(size: 20, weight: .regular, design: .monospaced))
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text(TeamArray.teamMembers[index].role)
                                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                    Text("para: \nmaricota, toy, luke, yoda, fofa, poppy e ode ")
                        .padding()
                        .font(.system(size: 20, weight: .regular, design: .monospaced))
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
