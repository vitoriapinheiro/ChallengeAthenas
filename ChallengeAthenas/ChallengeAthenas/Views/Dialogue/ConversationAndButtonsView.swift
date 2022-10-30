//
//  CaixaDeTexto.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI


struct ConversationAndButtonsView: View {
    let levelArray = LevelArray()
    @ObservedObject var dialoguePosition: DialoguePosition
    @ObservedObject var levelNumber: ActualLevel
    var speaker: String = ""
    
    init(observedDialogue: DialoguePosition, observedLevel: ActualLevel){
        self.dialoguePosition = observedDialogue
        self.levelNumber = observedLevel
        self.speakerChanger()
    }
    
        private mutating func speakerChanger(){
            if levelArray.levels[levelNumber.level].speakerArray[dialoguePosition.position] {
                speaker = "Eu"
            }else {
                speaker = levelArray.levels[levelNumber.level].bossName
            }
        }
    
    var body: some View {
        let actualLevel = levelArray.levels[levelNumber.level]
        
        VStack (spacing: 0) {
            Spacer()
            
            //Nome do personagem
            HStack {
                Spacer()
                    .frame(width:16)
                
                ZStack {
                    actualLevel.dialogueColor
                    Text(speaker)
                        .font(.custom("xilosa", size: 24))
                        .foregroundColor(.white)
                        .offset(y: -2)
                    
                }.frame(width: CGFloat(levelArray.levels[levelNumber.level].bossName.count * 15), height: 44)
                    .offset(y:14)
                
                Spacer()
            }
            
            //Caixa de fala
            HStack {
                Spacer().frame(width: 16)
                
                //Fala
                ZStack {
                    actualLevel.dialogueColor
                    
                    VStack {
                        Spacer().frame(height: 16)
                        
                        HStack {
                            Spacer().frame(width: 16)
                            
                            Text (actualLevel.dialogueArray[dialoguePosition.position])
                                .font(.bold(.body)())
                                .foregroundColor(.white)
                            
                            Spacer().frame(width: 16)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    
                    //Next button
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            NextDialogueButton(dialoguePosition: dialoguePosition, actualLevel: levelNumber)
                            Spacer().frame(height: 16)
                        }
                        Spacer().frame(width: 16)
                    }
                }.frame(height: 136)
                
                Spacer().frame(width: 16)
            }
            
            Spacer().frame(height: 24)
            
            //Botões
            HStack {
                Spacer()
                    .frame(width: 16)
                AppButton(title: "pular tudo", action: {
                    dialoguePosition.position = LevelArray().levels[levelNumber.level].dialogueArray.count - 1
                }, enable: true, isFill: true, height: 34, width: 102)
                Spacer()
                
                HStack(spacing: 16) {
                    //Voltar
                    AppButton(title: "voltar", action: {
                        if dialoguePosition.position > 0 {
                            dialoguePosition.position -= 1
                        }
                    }, enable: true, isFill: true, height: 34, width: 84)
                    
                    AppButton(title: "auto", action: {}, enable: true, isFill: true, height: 34, width: 84)
                    
                }.frame(height: 34)
                
                Spacer()
                    .frame(width: 16)
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}
