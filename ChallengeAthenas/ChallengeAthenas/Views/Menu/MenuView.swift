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
                
                Spacer()
                AppNavigationButton(
                    title: "Continuar história",
                    nextView: {AnyView(DialogueView())},
                    isFill: true
                )
                
                AppNavigationButton(
                    title: "Ir para o Mapa",
                    nextView: {AnyView(MapView())},
                    isFill: true
                )
                AppNavigationButton(
                    title: "Configurações",
                    nextView: {AnyView(SettingsView())},
                    isFill: true
                )
                AppNavigationButton(
                    title: "Créditos",
                    nextView: {AnyView(CreditsView())},
                    isFill: false
                )
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

