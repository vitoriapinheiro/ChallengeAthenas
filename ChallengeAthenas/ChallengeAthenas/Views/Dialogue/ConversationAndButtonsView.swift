//
//  CaixaDeTexto.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI


struct ConversationAndButtonsView: View {
    
    var body: some View {
        VStack (spacing: 0) {
            Spacer()
            
            //Nome do personagem
            HStack {
                Spacer()
                    .frame(width:16)
                
                ZStack {
                    Color.green
                    Text("Mofia")
                        .foregroundColor(.white)
                    
                }.frame(width: 85, height: 44)
                    .offset(y:14)
                
                Spacer()
            }
            
            //Caixa de fala
            HStack {
                Spacer()
                    .frame(width: 16)
                
                //Fala
                ZStack {
                    Color.green
                    
                    HStack {
                        Spacer().frame(width: 16)
                        
                        Text ("Lorem ipsum dolor sit amet, ctetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua amet.")
                            .foregroundColor(.white)
                        
                        Spacer().frame(width: 16)
                    }.frame(alignment: .topLeading)
                }.frame(height: 136)
                
                Spacer()
                    .frame(width: 16)
            }
            
            Spacer().frame(height: 24)
            
            //Botões
            HStack {
                Spacer()
                    .frame(width: 16)
                
                Color.red.frame(width: 102, height: 34)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Color.red
                        .frame(width: 84)
                    
                    Color.red
                        .frame(width: 84)
                    
                }.frame(height: 34)
                
                Spacer()
                    .frame(width: 16)
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}
