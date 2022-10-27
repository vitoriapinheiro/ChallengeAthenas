//
//  MenuView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @Binding var level: Int
    let credits: Bool = false
    let bkgImg: [String] = [
        "marco-zero",
        "hell",
        "beach"
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
                    title: "CONTINUAR",
                    nextView: {AnyView(DialogueView())},
                    isEnable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
                AppNavigationButton(
                    title: "MAPA",
                    nextView: {AnyView(MapView(level: $level))},
                    isEnable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
                AppNavigationButton(
                    title: "CONFIGURAÇÕES",
                    nextView: {AnyView(SettingsView())},
                    isEnable: false,
                    isFill: true,
                    height: 48,
                    width: 300
                )
                AppNavigationButton(
                    title: "créditos",
                    nextView: {AnyView(CreditsView())},
                    isEnable: true,
                    isFill: false,
                    height: 48,
                    width: 300
                )
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            }
            
        }
    }
}

