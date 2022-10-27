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
                ZStack{
                    Image("botao")
                        .resizable()
                        .frame(width: 102, height: 34)
                    Text("pular tudo")
                        .foregroundColor(.white)
                        .onTapGesture {
                            dialoguePosition.position = LevelArray().levels[levelNumber.level].dialogueArray.count - 1
                        }
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    //Voltar
                    ZStack{
                        Image("botao")
                            .resizable()
                            .frame(width: 84)
                            .onTapGesture {
                                if dialoguePosition.position > 0 {
                                    dialoguePosition.position -= 1
                                }
                            }
                        Text("voltar")
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        Image("botao")
                            .resizable()
                            .frame(width: 84)
                        
                        Text("auto")
                            .foregroundColor(.white)
                    }
                    
                }.frame(height: 34)
                
                Spacer()
                    .frame(width: 16)
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
}
