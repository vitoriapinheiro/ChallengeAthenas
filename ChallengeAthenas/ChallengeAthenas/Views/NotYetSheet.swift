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
            Color.black.opacity(0.5).onTapGesture {
                notYetLevel = false
            }
            .ignoresSafeArea()
            
            ZStack{
                Image("small-popup-bg")
                    .frame(width: 351, height: 384)
                
                VStack (spacing: 28){
                    //Spacer()
                    VStack (spacing: 9){
                        PopUpTitle(text: "NÍVEL BLOQUEADO")
                        HStack{
                            Spacer().frame(width: 36)
                            Text("Tu tem que comer muito feijão pra chegar aqui... Termina teus níveis anteriores.")
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .font(.custom("xilosa", size: 24))
                            Spacer().frame(width: 36)
                        }
                    }
                    AppButton(
                        title: "OK, BOY",
                        action: {notYetLevel = false},
                        //                    action: {showPopUp = false},
                        enable: true,
                        isFill: true,
                        height: 55,
                        width: 300,
                        big: true,
                        size: 20
                    )
                }
            }
        }
    }
}
