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
            //Background
            actualLevel.background
                .resizable()
                .ignoresSafeArea()
            
            //Personagem
            if dialoguePosition.position > 4 {
                VStack {
                    Spacer()
                    actualLevel.bossImage
                        .offset(x:50, y: 50)
                }.ignoresSafeArea()
            }
            //Caixas de texto e botões de fala
            ConversationAndButtonsView(observedDialogue: dialoguePosition, observedLevel: levelNumber)
            
            //Pause
            PauseButtonView(sheetIsActive: $pauseIsActive)
            
            //PopUp
            if pauseIsActive {
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
