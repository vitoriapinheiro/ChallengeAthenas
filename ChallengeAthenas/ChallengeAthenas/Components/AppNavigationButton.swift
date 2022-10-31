//
//  AppNavigationButton.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct AppNavigationButton: View {
    let title: String
    let nextView: () -> AnyView
    let isEnable: Bool
    let isFill: Bool
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        NavigationLink(
            destination: nextView(),
            label: {
                Text(title)
                    .font(.custom("xilosa", size: 22))
                    .bold()
                    .foregroundColor(isEnable ? Color.white : Color(red: 0.50, green: 0.22, blue: 0.00))
                    .frame(width: 300, height: 48)
                    .background(isFill ?
                                (isEnable ?
                                 Image("botao")
                                    .resizable()
                                    .opacity(100)
                                 :
                                Image("botaoSecundario")
                                    .resizable()
                                    .opacity(100)
                                )
                                :
                                Image("botao")
                                .resizable()
                                .opacity(0)
                    )
            }
        )
    }
}



struct AppNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationButton(title: "teste", nextView: {AnyView(DialogueView())}, isEnable: true, isFill: true, height: 30, width: 100)
    }
}
