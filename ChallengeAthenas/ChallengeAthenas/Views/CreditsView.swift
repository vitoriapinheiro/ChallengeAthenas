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
                HStack {
                    Spacer()
                    Image("luaTemporaria")
                        .rotationEffect(Angle(degrees: 2))
                    Spacer()
                        .frame(width: 8)
                }
                Spacer()
                    .frame(height: 700)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("cactoTemporario")
                    Spacer()
                        .frame(width: 290)
                }
                Spacer()
                    .frame(height: 0)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image("fogueiraTemporaria")
                    Spacer()
                        .frame(width: 0)
                }
                Spacer()
                    .frame(height: 0)
            } .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
