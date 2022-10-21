//
//  PauseMenuSheet.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI

struct PauseMenuSheet: View {
    @Binding var sheetIsActive: Bool
    @State private var phase = 0.0
    @State var soundColor: Array = [Color.yellow,Color.white,Color.white,Color.white,Color.white]
    @State var musicColor: Array = [Color.yellow,Color.white,Color.white,Color.white,Color.white]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                    sheetIsActive = false
                }
            ZStack {
                
                Color(red: 0.15, green: 0.13, blue: 0.11)
                    .frame(width: 351, height: 575)
                
                VStack (spacing: 34) {
                    Text( "PAUSA")
                        .font(.system(size: 48))
                        .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07).opacity(0.8))
                        .frame(alignment: .center)
                    
                    HStack {
                        Spacer()
                            .frame(width: 42)
                        
                        VStack (alignment: .leading, spacing: 18) {
                            Text("Configurações")
                                .font(.system(size: 24))
                                .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07))
                                .frame(alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                HStack {
                                    Text("Sons do jogo:")
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    HStack (alignment: .lastTextBaseline, spacing: 11) {
                                        ForEach(0..<5) { index in
                                            Rectangle()
                                                .frame(width: 16, height: 16, alignment: .trailing)
                                                .foregroundColor(soundColor[index])
                                                .onTapGesture {
                                                    soundColor = [Color.yellow,Color.white,Color.white,Color.white,Color.white]
                                                    for i in 0...index {
                                                        soundColor[i] = Color.yellow
                                                    }
                                                    
                                                }
                                        }
                                    }
                                }
                                
                                HStack {
                                    Text("Música:")
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    HStack (alignment: .lastTextBaseline, spacing: 11) {
                                        ForEach(0..<5) { index in
                                            Rectangle()
                                                .frame(width: 16, height: 16, alignment: .trailing)
                                                .foregroundColor(musicColor[index])
                                                .onTapGesture {
                                                    musicColor = [Color.yellow,Color.white,Color.white,Color.white,Color.white]
                                                    for i in 0...index {
                                                        musicColor[i] = Color.yellow
                                                    }
                                                    
                                                }
                                        }
                                    }
                                }
                                HStack {
                                Text("Aumento de contraste:")
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
                                ZStack{
                                    Color.red
                                        .frame(height: 52)
                                        .onTapGesture {
                                            sheetIsActive = false
                                        }
                                    
                                    Text("VOLTAR AO JOGO")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                                
                                ZStack{
                                    Color.gray
                                        .frame(height: 52)
                                    
                                    Text("REINICIAR")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }
                            }
                            
                            Text("VOLTAR AO MAPA")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            
                        }
                        
                        Spacer()
                            .frame(width: 42)
                    }
                    
                    
                }.frame(width: 351)
                
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 8, dash: [20], dashPhase: phase))
                    .foregroundColor(Color(red: 1.00, green: 0.82, blue: 0.07).opacity(0.8))
                    .frame(width: 351, height: 575)
                                    .onAppear {
                                        withAnimation(.linear.repeatForever(autoreverses: false)) {
                                            phase -= 40
                                        }
                                    }
            }
        }.ignoresSafeArea()
    }
}

struct PauseMenuSheet_Previews: PreviewProvider {
    static var previews: some View {
        PauseMenuSheet(sheetIsActive: DialogueView().$pauseIsActive)
            .previewDevice("iPhone 12")
    }
}
