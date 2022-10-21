//
//  ContentView.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI

struct DialogueView: View {
    @State var pauseIsActive = false
    
    var body: some View {
        ZStack {
            //Background
            Image("manguebg")
                .resizable()
                .ignoresSafeArea()
            
            //Personagem
            VStack {
                Spacer()
                Image("bonecaTeste")
                    .offset(x:100, y: 50)
                    .frame(alignment: .bottomTrailing)
            }.ignoresSafeArea()
            
            //Caixas de texto e botões de fala
            ConversationAndButtonsView()
            
            //Pause
            PauseButtonView(sheetIsActive: $pauseIsActive)
            
            //PopUp
            if pauseIsActive == true {
                PauseMenuSheet(sheetIsActive: $pauseIsActive)
            }
            
        }
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView()
            .previewDevice("iPhone 12")
    }
}
