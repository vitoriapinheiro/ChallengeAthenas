//
//  ErrorView.swift
//  ChallengeAthenas
//
//  Created by Bof on 28/10/22.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    @Binding var error: Bool
    
    var body: some View {
        ZStack {
            MediumSheet(showPopUp: $error, imageName: "cranio-laranja", title: "BUGOU,\nBOY!", details: "VISH, deu erro no jogo. Tenta reiniciar :D")
        }
        .background(Image("standardBG")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}

