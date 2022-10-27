//
//  FutureView.swift
//  ChallengeAthenas
//
//  Created by Bof on 24/10/22.
//

import Foundation
import SwiftUI

struct FutureSheet: View {
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                                    showPopUp = false
                                }
                .ignoresSafeArea()
            VStack {
                PopUpTitle(text: "PRO\nFUTURO")
                Image("luaIMG")
                    .fixedSize()
                Text("Tamo trabalhando em coisa massa pra tu! Fica de olho...")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.custom("SF Pro", size: 20))
                    .frame(width: 214, alignment: .center)
                    .padding()

                AppButton(
                    title: "OK, BOY",
                    action: {showPopUp = false},
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300
                )
            }
            
        }
        .background(
            Image("big-popup-bg")
                .frame(width: 351, height: 501)
        )
    }
}

struct FutureSheet_Previews: PreviewProvider {
    static var previews: some View {
        FutureSheet(showPopUp: MapView(level: ContentView(level: 0).$level).$showPopUp)
    }
}
