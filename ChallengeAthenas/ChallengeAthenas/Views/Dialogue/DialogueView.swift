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
    @State var pauseIsActive = false
    let levelArray = LevelArray()
    @StateObject var levelNumber = ActualLevel()
    @StateObject var dialoguePosition = DialoguePosition()
    
    var body: some View {
        let actualLevel = levelArray.levels[levelNumber.level]
        
        ZStack {
            
            //Personagem
            if dialoguePosition.position > 4  && levelNumber.level == 0 {
                VStack {
                    Spacer()
                    actualLevel.bossImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x:50, y: 50)
                }.ignoresSafeArea()
            }
            
            if dialoguePosition.position > 0  && levelNumber.level == 1 {
                VStack {
                    Spacer()
                    actualLevel.bossImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x:50, y: 50)
                    Spacer()
                }
            }
            
            if levelNumber.level == 2 {
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
                HStack{
                    VStack{
                        //Spacer().frame(height: 62)
                        ZStack{
                            Image("tituloLevel")
                            Text(actualLevel.title)
                                .foregroundColor(.white)
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
                PauseMenuSheet(sheetIsActive: $pauseIsActive)
            }
        }.background(actualLevel.background
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
        )
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView()
            .previewDevice("iPhone 12")
    }
}
