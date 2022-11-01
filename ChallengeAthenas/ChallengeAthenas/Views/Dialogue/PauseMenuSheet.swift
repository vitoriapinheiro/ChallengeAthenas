//
//  PauseMenuSheet.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI
import AVFAudio

struct PauseMenuSheet: View {
    @Binding var sheetIsActive: Bool
    @Binding var level: Int
    @ObservedObject var dialoguePosition: DialoguePosition
    @ObservedObject var levelNumber: ActualLevel
    @State private var sound = 50.0
    @State private var music = 50.0
    @State private var isEditing = false
    @State private var soundLevel: Float = 0.5
    @State private var musicLevel: Float = 0.5
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                    sheetIsActive = false
                }
            ZStack {
                
                VStack{
                    Spacer().frame(height: 134)
                    HStack{
                        Spacer().frame(width: 20)
                        Image("pauseSheet")
                            .resizable()
                        Spacer().frame(width: 20)
                    }
                    Spacer().frame(height: 134)
                }
    
                
                VStack (spacing: 34) {
                    Text( "PAUSA")
                        .font(.custom("xilosa", size: 48))
                        .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07).opacity(0.8))
                        .frame(alignment: .center)
                    
                    HStack {
                        Spacer()
                            .frame(width: 42)
                        
                        VStack (alignment: .leading, spacing: 18) {
                            Text("Configurações")
                                .font(.custom("xilosa", size: 24))
                                .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07))
                                .frame(alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                HStack {
                                    Text("Sons do jogo:")
                                        .font(.custom("xilosa", size: 18))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    //Slider de som
                                    Slider(value: $soundLevel, in: 0...1,step: 0.0625, onEditingChanged: { data in
                                        //MusicPlayer.setVolume(self.soundLevel)
                                            }).frame(width: 124)
                                }
                                
                                HStack {
                                    Text("Música:")
                                        .foregroundColor(.white)
                                        .font(.custom("xilosa", size: 18))
                                    
                                    Spacer()
                                    
                                    //Slider de Música
                                    Slider(value: $musicLevel, in: 0...1,step: 0.0625, onEditingChanged: { data in
                                        MusicPlayer.shared.setVolume(self.musicLevel)
                                            }).frame(width: 124)
                                }
                                HStack {
                                    Text("Aumento de contraste:")
                                        .font(.custom("xilosa", size: 18))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        Rectangle()
                                            .strokeBorder()
                                            .frame(width: 85, height: 28, alignment: .trailing)
                                            .foregroundColor(.white)
                                        
                                        Text("Off")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13))
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                            .frame(width: 42)
                    }
                    
                    HStack {
                        Spacer()
                            .frame(width: 42)
                        VStack (alignment: .center, spacing: 36){
                            VStack{
                                
                                AppButton(title: "CONTINUAR", action: {sheetIsActive = false}, enable: true, isFill: true, height: 55, width: 267, big: true, size: 20).padding(.vertical, 16)

                                //Tocar musica
                                //AppButton(title: "CONTINUAR", action: {MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Ataque do Carangueijo")}, enable: true, isFill: true, height: 55, width: 267, big: true, size: 20).padding(.vertical, 16)
                                
                                AppButton(title: "REINICIAR DIÁLOGO", action: {dialoguePosition.position = 0
                                    sheetIsActive = false
                                }, enable: false, isFill: true, height: 55, width: 267, big: true, size: 20)
                            }
                            
                            
                            AppNavigationButton(title: "VOLTAR AO MAPA", nextView: {AnyView(MapView(level: ContentView().$level))}, isEnable: true, isFill: false, height: 24, width: 148)
                            
                        }
                        
                        Spacer()
                            .frame(width: 42)
                    }
                    
                    
                }.frame(width: 351)
                
                //                Rectangle()
                //                    .strokeBorder(style: StrokeStyle(lineWidth: 8, dash: [20], dashPhase: phase))
                //                    .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07).opacity(0.8))
                //                    .frame(width: 351, height: 575)
                //                                    .onAppear {
                //                                        withAnimation(.linear.repeatForever(autoreverses: false)) {
                //                                            phase -= 40
                //                                        }
                //                                    }
            }
        }.ignoresSafeArea()
    }
}
