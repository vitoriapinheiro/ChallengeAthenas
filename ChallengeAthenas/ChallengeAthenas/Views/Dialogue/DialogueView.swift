//
//  ContentView.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI

class ActualLevel: ObservableObject {
    @Published var level = 0
}

class DialoguePosition: ObservableObject {
    @Published var position = 0
}



struct DialogueView: View {
    @Binding var level: Int
    @State var pauseIsActive = false
    var levelArray = LevelArray()
    @StateObject var levelNumber = ActualLevel()
    @StateObject var dialoguePosition = DialoguePosition()
    
    var body: some View {
        let actualLevel = levelArray.levels[level]
        ZStack {
            Color.black.ignoresSafeArea()
            
            
            ZStack{
                if dialoguePosition.position == 1 && level == 0{
                    Image("bgEmpty1")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                else if dialoguePosition.position == 2 && level == 0{
                    Image("bgEmpty2")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                else {
                    actualLevel.background
                        .resizable()
                        .ignoresSafeArea()
                }
            }
            
            ZStack {
                
               
                
                //Personagem
                //Mofia
                if dialoguePosition.position > 2  && level == 0 {
                    VStack {
                        Spacer()
                        actualLevel.bossImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x:50, y: 50)
                    }.ignoresSafeArea()
                }
                
                //Cebrutius
                if dialoguePosition.position > 0  && level == 1 {
                    VStack {
                        Spacer()
                        actualLevel.bossImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x:50, y: 50)
                        Spacer()
                    }
                }
                
                // Tela preta de mofia
                if dialoguePosition.position >= 15 && level == 0 {
                    Color(.black).ignoresSafeArea()
                }
                
                //Chico
                if level == 2 {
                    VStack {
                        Spacer()
                        actualLevel.bossImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x:50, y: 50)
                        Spacer()
                    }
                }
                
                //Caixas de texto e botões de fala
                ConversationAndButtonsView(observedDialogue: dialoguePosition, observedLevel: levelNumber)
                
                //Título
                if dialoguePosition.position < 2 {
                    VStack{
                        ZStack{
                            HStack{
                                Image("tituloLevel")
                                Spacer()
                            }
                            
                            HStack{
                                Spacer().frame(width: 16)
                                Text(actualLevel.title)
                                    .font(.custom("xilosa", size: 22))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
                //Pause
                PauseButtonView(sheetIsActive: $pauseIsActive)
                
                //PopUp
                if pauseIsActive {
                    PauseMenuSheet(sheetIsActive: $pauseIsActive, level: $level, dialoguePosition: dialoguePosition, levelNumber: levelNumber)
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(level: ContentView().$level)
    }
}
