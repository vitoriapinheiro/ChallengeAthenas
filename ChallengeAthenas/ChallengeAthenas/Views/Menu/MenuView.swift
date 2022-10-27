//
//  MenuView.swift
//  ChallengeAthenas
//
//  Created by thaxz on 27/10/22.
//

import Foundation
import SwiftUI

struct MenuView: View {
    
    @Binding var level: Int
    
    let credits: Bool = false
    
    let bkgImg: [String] = [
        "marcoMenu",
        "hell"
    ]
    
    var body: some View {        
        
        ZStack{
            
            Image(bkgImg[level])
                .resizable()
                .ignoresSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            
            VStack {
                
                VStack(spacing: -50) {
                    
                    Image("gameTitle")
                        .padding(.vertical, 50)
                    
                    Text("os Nove Circulos")
                        .font(.custom("xilosa", size: 32))
                        .foregroundColor(.white)
                }
                    
                Spacer()
                
                AppInitialButton(
                    title: "CONTINUAR",
                    nextView: {AnyView(DialogueView())},
                    isSecondary: false
                )
                
              
                HStack(spacing: 16){
                    
                    AppInitialButton(
                        title: "NOVO JOGO",
                        nextView: {AnyView(DialogueView())},
                        isSecondary: true
                    )
                    
                    AppInitialButton(
                        title: "MODO DUELO",
                        nextView: {AnyView(MapView())},
                        isSecondary: true
                    )
                    

                }
                .padding(.horizontal, 15)
                //.background(.yellow)
               
                AppNavigationButton(
                    title: "Créditos",
                    nextView: {AnyView(CreditsView())},
                    isFill: false
                )
                .padding(.bottom, 80)
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

