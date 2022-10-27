//
//  FutureView.swift
//  ChallengeAthenas
//
//  Created by Bof on 24/10/22.
//

import Foundation
import SwiftUI

struct NotYetSheet: View {
    @Binding var notYetLevel: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                    notYetLevel = false
                }
                .ignoresSafeArea()
            VStack {
                PopUpTitle(text: "NÍVEL BLOQUEADO")
                Text("Tu tem que comer muito feijão pra chegar aqui... Termina teus níveis anteriores.")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.custom("SF Pro", size: 20))
                    .frame(width: 214, alignment: .center)
                    .padding()
                AppButton(
                    title: "OK, BOY",
                    action: {notYetLevel = false},
                    //                    action: {showPopUp = false},
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
            }
            
        }
        .background(
            Image("small-popup-bg")
                .frame(width: 351, height: 384)
        )
    }
}
