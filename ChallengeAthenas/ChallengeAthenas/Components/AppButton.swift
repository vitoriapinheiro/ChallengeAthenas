//
//  AppButton.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct AppButton: View {
    let title: String
    let action: () -> Void
    let enable: Bool
    let isFill: Bool
    let height: CGFloat
    let width: CGFloat
    let big: Bool
    let size: CGFloat
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .font(.custom(big ? "xilosa":"xilo-sans", size: size))
                .bold()
                .foregroundColor(enable ? Color.white : Color(red: 0.50, green: 0.22, blue: 0.00))
                .frame(width: width, height: height)
                .background(
                    isFill ?
                    (enable ?
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

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(title: "Botão", action: {}, enable: true, isFill: true, height: 34, width: 102, big: false, size: 16)
    }
}

