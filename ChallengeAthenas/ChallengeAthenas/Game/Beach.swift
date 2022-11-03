//
//  Beach.swift
//  ChallengeAthenas
//
//  Created by vivi on 31/10/22.
//

import Foundation
import SwiftUI

struct BeachView: View {
    @Binding var level: Int
    
    let bkgImg: [String] = ["Praia", "Mangue"]
    
    @State var startGame = true
    @State var lostGame = false
    @State var wonGame = false
    
    @State var timeMusic = 68
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var timerMusic = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var pauseIsActive = false
    
    @State var points = 304.0
    
    @State var screenWidth = CGFloat(0)
    @State var screenHeight = CGFloat(0)
    
    @State var crossPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3.1)
    @State var crossSize = CGFloat(1)
    @State var crossTapped = false
    
    @State var hatPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3)
    @State var hatSize = CGFloat(1)
    @State var hatTapped = false
    
    @State var starPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3)
    @State var starSize = CGFloat(1)
    @State var starTapped = false
    
    @State var fishbonePosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3.1)
    @State var fishboneSize = CGFloat(1)
    @State var fishboneTapped = false
    
    @State var crossfirst = true
    @State var hatfirst = true
    @State var starfirst = true
    @State var fishfirst = true
    
    let teste: Image = {
        return Image("CebruthiusFace")
    }()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(bkgImg[level])
                    .resizable()
                    .ignoresSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                VStack {
                    Image("Rainbow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 365, height: 429)
                        .padding(.bottom, -130)
                }
                
                Image("CrossObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: crossSize, height: crossSize)
                    .position(self.crossPosition)
                    .onReceive(self.timer) { _ in
                            self.crossMove()
                    }
                
                Image("HatObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: hatSize, height: hatSize)
                    .position(self.hatPosition)
                    .onReceive(self.timer) { _ in
                            self.hatMove()
                        }
                
                
                Image("StarObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: starSize, height: starSize)
                    .position(self.starPosition)
                    .onReceive(self.timer) { _ in
                        self.starMove()
                        }
                
                Image("FishboneObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fishboneSize, height: fishboneSize)
                    .position(self.fishbonePosition)
                    .onReceive(self.timer) { _ in
                            self.fishboneMove()
                    }
                
                VStack{
                    secondsToHoursMinutesSeconds(timeMusic)
                        .font(.custom("xilosa", size: (40)))
                        .foregroundColor(.white)
                        .onReceive(self.timerMusic) { _ in
                            if timeMusic <= 0 {
                                wonGame = true
                                level = 1
                                self.timeMusic = 68
                            }else {
                                self.timeMusic -= 1
                            }
                        }
                    Spacer()
                    VStack(spacing: 0){
                        teste
                            .resizable()
                            .zIndex(1)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 127, height: 127)
                            .padding(.bottom, -20)
                        
                        //Rainbow
                        Spacer().frame(height: 329)
                        
                        HStack(alignment: .center,spacing: 20){
                            Image("Cross")
                                .padding(.bottom, 85)
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            checkCollision(0)
                                        }
                                )
                            Image("Hat")
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            checkCollision(1)
                                        }
                                )
                            Image("Star")
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            checkCollision(2)
                                        }
                                )
                            Image("Fishbone")
                                .padding(.bottom, 85)
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            checkCollision(3)
                                        }
                                )
                        }
                    }
                    .frame(width: 366, height: 555)
                    Lifebar(status: $points)
                }
                .padding(.top, 60)
                
                PauseButtonView(sheetIsActive: $pauseIsActive)
                    .padding(.top, 60)
                
                if pauseIsActive {
                    PauseMenuSheet(
                        sheetIsActive: $pauseIsActive,
                        level: ContentView().$level,
                        dialoguePosition: DialogueView(level: ContentView().$level).dialoguePosition,
                        levelNumber: DialogueView(level: ContentView().$level).levelNumber
                    )
                }
                if wonGame {
                    ResultSheet(showPopUp: $wonGame)
                }
                
                else if lostGame {
                    LargeSheet(
                        showPopUp: $lostGame,
                        imageName: "cranio-laranja",
                        title: "Perdesse,\nBoy!",
                        details: "O bichão te venceu na tora! Vai deixar, é?",
                        primaryLabel: "TENTAR DE NOVO",
                        primaryAction: {
                            timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                            lostGame = false
                            startGame = true
                            points = 304.0
                        },
                        secondaryLabel: "VOLTAR AO MAPA",
                        secondaryAction: {
                            print("Eita")
                        }
                    )
                }
                
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
                        .onReceive(self.timer){ _ in
                            self.screenWidth = geo.size.width
                            self.screenHeight = geo.size.height
                            gameControl()
                        }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
//        .navigate(to: MangroveView(), when: $lostGame)
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> Text {
        return Text("0\(seconds/60):\(seconds % 60)")
    }
    
    func gameControl(){
//        DispatchQueue.main.asyncAfter(deadline: .now()){
            if (self.startGame){
                MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "O Demônio dos Mares")
                self.startGame = false
            } else if pauseIsActive || wonGame {
                MusicPlayer.shared.audioPlayer.pause()
                self.timer.upstream.connect().cancel()
            } else {
                MusicPlayer.shared.audioPlayer.play()
                self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
            }
            calculatePoints()
//        }
    }
    
    func calculatePoints(){
        if (points <= 0){
            lostGame = true
            self.timer.upstream.connect().cancel()
            pauseIsActive = true
            print("Perdeu, boy")
        }
    }
    
    
    func checkCollision(_ objType: Int){
        HapticManager.instance.impact(style: .soft)
        if(objType == 0){
            if (self.crossPosition.y > UIScreen.screenHeight/1.3 - 70){
                crossTapped = true
            }
            
        } else if(objType == 1) {
            if(self.hatPosition.y > UIScreen.screenHeight/1.225 - 70){
                hatTapped = true
            }
            
        } else if(objType == 2) {
            if(self.starPosition.y > UIScreen.screenHeight/1.225 - 70){
                starTapped = true
            }
            
        } else {
            if(self.fishbonePosition.y > UIScreen.screenHeight/1.3 - 70){
                fishboneTapped = true
            }
            
        }
    }
    
    func crossMove() {
        if (UIScreen.screenHeight/1.3 + 15) > self.crossPosition.y{
            withAnimation{
                self.crossPosition.x -= 1.8*3
                self.crossPosition.y += 4.5*3
                self.crossSize += 1.1*3
            }
        } else {
            if(!crossTapped){
                HapticManager.instance.notification(type: .error)
                self.points -= 30
            } else {
                self.crossTapped = false
            }
            self.crossPosition.x = UIScreen.screenWidth/2
            self.crossPosition.y = UIScreen.screenHeight/3.1
            self.crossSize = 1
            self.crossfirst = true
        }
    }
    
    func hatMove() {
        if (UIScreen.screenHeight/1.225 + 15) > self.hatPosition.y{
            withAnimation{
                self.hatPosition.x -= 0.65*2.7
                self.hatPosition.y += 5*2.7
                self.hatSize += 1*2.7
            }
        } else {
            if(!hatTapped){
                HapticManager.instance.notification(type: .error)
                self.points -= 30
            } else {
                self.hatTapped = false
            }
            self.hatPosition.x = UIScreen.screenWidth/2
            self.hatPosition.y = UIScreen.screenHeight/3
            self.hatSize = 1
            self.hatfirst = true
        }
    }
    func starMove() {
        if (UIScreen.screenHeight/1.225 + 15) > self.starPosition.y{
            withAnimation{
                self.starPosition.x += 0.65*2
                self.starPosition.y += 5*2
                self.starSize += 1*2
            }
        } else {
            if(!starTapped){
                HapticManager.instance.notification(type: .error)
                self.points -= 30
            } else {
                self.starTapped = false
            }
            self.starPosition.x = UIScreen.screenWidth/2
            self.starPosition.y = UIScreen.screenHeight/3
            self.starSize = 1
            self.starfirst = true
        }
    }
    func fishboneMove() {
        if (UIScreen.screenHeight/1.3 + 15) > self.fishbonePosition.y{
            withAnimation{
                self.fishbonePosition.x += 1.8*2.2
                self.fishbonePosition.y += 4.5*2.2
                self.fishboneSize += 1*2.2
            }
        } else {
            if(!fishboneTapped){
                HapticManager.instance.notification(type: .error)
                self.points -= 30
            } else {
                self.fishboneTapped = false
            }
            self.fishbonePosition.x = UIScreen.screenWidth/2
            self.fishbonePosition.y = UIScreen.screenHeight/3.1
            self.fishboneSize = 1
            self.fishfirst = true
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
