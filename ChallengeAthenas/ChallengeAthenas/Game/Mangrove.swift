//
//  Mangrove.swift
//  ChallengeAthenas
//
//  Created by vivi on 02/11/22.
//

import Foundation
import SwiftUI

struct MangroveView: View{
    let level: Int = 0
    let bkgImg: [String] = ["Mangue"]
    
    @State var startGame = true
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var pauseIsActive = false
    
    @State var points = 304.0
    
    @State var screenWidth = CGFloat(0)
    @State var screenHeight = CGFloat(0)
    
    @State var crossPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3.1)
    @State var crossSize = CGFloat(1)
    
    @State var hatPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3)
    @State var hatSize = CGFloat(1)
    
    @State var starPosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3)
    @State var starSize = CGFloat(1)
    
    @State var fishbonePosition = CGPoint(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/3.1)
    @State var fishboneSize = CGFloat(1)
    
    let teste: Image = {
        return Image("mangueFace")
    }()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image(bkgImg[level])
                    .resizable()
                    .ignoresSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                VStack{
                    Text("3:00")
                        .font(.custom("xilosa", size: (40)))
                        .foregroundColor(.white)
                    Spacer()
                    VStack(spacing: 0){
                        teste
                            .resizable()
                            .zIndex(1)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 127, height: 127)
                            .padding(.bottom, -20)
                        Image("Rainbow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 365, height: 429)
                            .padding(.bottom, -100)
                        HStack(alignment: .center,spacing: 20){
                            Image("Cross")
                                .padding(.bottom, 85)
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            print("Cross")
                                        }
                                )
                            Image("Hat")
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            print("Hat")
                                        }
                                )
                            Image("Star")
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            print("Star")
                                        }
                                )
                            Image("Fishbone")
                                .padding(.bottom, 85)
                                .gesture(
                                    TapGesture()
                                        .onEnded{
                                            print("Fishbone")
                                        }
                                )
                        }
                    }
                    .frame(width: 366, height: 555)
                    Lifebar(status: $points)
                }
                .padding(.top, 60)
                
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...5)){
                            self.hatMove()                        }
    
                    }
                
//                ForEach(1..<5){ i in
//                    Image("StarObj")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: starSize, height: starSize)
//                        .position(x:self.starPosition.x + CGFloat(5*i), y: self.starPosition.y + CGFloat(50*i) )
//                        .onReceive(self.timer) { _ in
//                            let time1: UInt64 = UInt64(i)
//                            let time = DispatchTime(uptimeNanoseconds: time1)
//                            DispatchQueue.main.asyncAfter(deadline: time){
//                                self.starMove()
//                            }
//                    }
//                }
                
                Image("StarObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: starSize, height: starSize)
                    .position(self.starPosition)
                    .onReceive(self.timer) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 1...5)){
                            self.starMove() }
                    }
                
                Image("FishboneObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fishboneSize, height: fishboneSize)
                    .position(self.fishbonePosition)
                    .onReceive(self.timer) { _ in
                        self.fishboneMove()
                    }
                
                CounterView()
                
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
    }
    
    func gameControl(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            if (self.startGame){
                MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Ataque do Carangueijo")
                self.startGame = false
            } else if (pauseIsActive){
                MusicPlayer.shared.audioPlayer.pause()
                self.timer.upstream.connect().cancel()
            } else {
                MusicPlayer.shared.audioPlayer.play()
                self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
            }
        }
    }
    
    func calculatePoints(){
        if (points <= 0){
            points = 304.0
        }
    }
    
    
    func checkCollision(objType: Int){
        if(objType == 0){
            
        } else if(objType == 1) {
            
        } else if(objType == 2) {
            
        } else {
            
        }
    }
    
    func crossMove() {
        if (UIScreen.screenHeight/1.3) > self.crossPosition.y{
            withAnimation{
                self.crossPosition.x -= 1.8
                self.crossPosition.y += 4.5
                self.crossSize += 1.1
            }
        } else {
//            HapticManager.instance.impact(style: .soft)
            self.points -= 10
            self.crossPosition.x = UIScreen.screenWidth/2
            self.crossPosition.y = UIScreen.screenHeight/3.1
            self.crossSize = 1
        }
    }
    
    func hatMove() {
        if (UIScreen.screenHeight/1.225) > self.hatPosition.y{
            withAnimation{
                self.hatPosition.x -= 0.65
                self.hatPosition.y += 5
                self.hatSize += 1
            }
        } else {
//            HapticManager.instance.impact(style: .light)
            self.points -= 10
            self.hatPosition.x = UIScreen.screenWidth/2
            self.hatPosition.y = UIScreen.screenHeight/3
            self.hatSize = 1
        }
    }
    func starMove() {
        if (UIScreen.screenHeight/1.225) > self.starPosition.y{
            withAnimation{
                self.starPosition.x += 0.65
                self.starPosition.y += 5
                self.starSize += 1
            }
        } else {
//            HapticManager.instance.impact(style: .light)
            self.points -= 10
            self.starPosition.x = UIScreen.screenWidth/2
            self.starPosition.y = UIScreen.screenHeight/3
            self.starSize = 1
        }
    }
    func fishboneMove() {
        if (UIScreen.screenHeight/1.3) > self.fishbonePosition.y{
            withAnimation{
                self.fishbonePosition.x += 1.8
                self.fishbonePosition.y += 4.5
                self.fishboneSize += 1
            }
        } else {
//            HapticManager.instance.impact(style: .soft)
            self.points -= 10
            self.fishbonePosition.x = UIScreen.screenWidth/2
            self.fishbonePosition.y = UIScreen.screenHeight/3.1
            self.fishboneSize = 1
        }
    }
}
