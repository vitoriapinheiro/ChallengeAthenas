//
//  ResultSheet.swift
//  ChallengeAthenas
//
//  Created by Bof on 01/11/22.
//

import Foundation
import SwiftUI

struct ResultSheet: View {
    @Binding var showPopUp: Bool
    var starRating: Int = 3
    let titles: [String] = ["Valeu,\nman!", "Forte\ndemais!", "É o bichão\nmemo!"]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                    showPopUp = false
                }
                .ignoresSafeArea()
            VStack {
                PopUpTitle(text: titles[(starRating - 1)], colorPick: false)
                HStack {
                    Image("star-yellow")
                        .resizable()
                        .frame(width: 72, height: 69)
                    Image(starRating == 1 ? "star-grey" : "star-yellow")
                        .resizable()
                        .frame(width: 72, height: 69)
                    Image(starRating < 3 ? "star-grey" : "star-yellow")
                        .resizable()
                        .frame(width: 72, height: 69)
                }
                Text("Tu metesse a braba!")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.custom("xilosa", size: 20))
                    .frame(width: 214, alignment: .center)
                    .padding()
                
                AppButton(title: "PRÓXIMO NÍVEL", action: {}, enable: true, isFill: true, height: 55, width: 267, big: true, size: 20)
                AppButton(title: "REPETIR", action: {}, enable: false, isFill: true, height: 55, width: 267, big: true, size: 20)
                AppButton(title: "VOLTAR AO MAPA", action: {}, enable: true, isFill: false, height: 55, width: 267, big: true, size: 20)
            }
            
        }
        .frame(width: 351, height: 575)
        .background(
            Image("large-popup-bg")
                .frame(width: 351, height: 575)
        )
    }
}
