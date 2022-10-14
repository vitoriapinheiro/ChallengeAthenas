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
                AppButton(
                    title: "Continuar",
                    action: {print("Você clicou em continuar")},
                    enable: false,
                    isFill: true
                )
                AppButton(
                    title: "Novo Jogo",
                    action: {print("Você clicou em Novo Jogo")},
                    enable: true,
                    isFill: true
                )
                AppButton(
                    title: "Créditos",
                    action: {print("Você clicou em Créditos")},
                    enable: true,
                    isFill: false
                )
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            }
            
        }
    }
}

