//
//  LargeSheet.swift
//  ChallengeAthenas
//
//  Created by Bof on 01/11/22.
//

import Foundation
import SwiftUI

struct LargeSheet: View {
    // usada por game over & sheet de aviso qnd aperta novo jogo qnd a pessoa ja tem um pra continuar
    @Binding var showPopUp: Bool
    
    var imageName: String
    var title: String
    var details: String
    var primaryLabel: String
    var secondaryLabel: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                                    showPopUp = false
                                }
                .ignoresSafeArea()
            VStack {
                PopUpTitle(text: title, colorPick: true)
                Image(imageName)
                    .fixedSize()
                Text(details)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.custom("xilosa", size: 20))
                    .frame(width: 214, alignment: .center)
                    .padding()

                AppButton(title: "\(primaryLabel)", action: {}, enable: true, isFill: true, height: 55, width: 267, big: true, size: 20)
                AppButton(title: "\(secondaryLabel)", action: {}, enable: false, isFill: true, height: 55, width: 267, big: true, size: 20)
            }
            
        }
        .frame(width: 351, height: 575)
        .background(
            Image("large-popup-bg")
                .frame(width: 351, height: 575)
        )
    }
}

//struct LargeSheet_Preview: PreviewProvider {
//    static var previews: some View {
////        LargeSheet(showPopUp: MapView(level: ContentView(level: 0).$level).$showPopUp)
//        LargeSheet(showPopUp: $nomedostate, imageName: "cranio-laranja", title: "Perdesse,\nBoy!", details: "O bichão te venceu na tora! Vai deixar, é?", primaryLabel: "TENTAR DE NOVO", secondaryLabel: "VOLTAR AO MAPA")
//    }
//}
