//
//  Beach.swift
//  ChallengeAthenas
//
//  Created by vivi on 31/10/22.
//

import Foundation
import SwiftUI

struct BeachView: View {
    let level: Int = 0
    let bkgImg: [String] = ["Praia"]
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var pauseIsActive = false
    
    @State var points = 304.0
    
    @State var screenWidth = CGFloat(0)
    @State var screenHeight = CGFloat(0)
    
    @State var crossPosition = CGPoint(x: UIScreen.main.bounds.height/2, y: 300)
    @State var crossSize = CGFloat(1)
    
    @State var hatPosition = CGPoint(x: UIScreen.main.bounds.height/2, y: 300)
    @State var hatSize = CGFloat(1)
    
    @State var starPosition = CGPoint(x: UIScreen.main.bounds.height/2, y: 300)
    @State var starSize = CGFloat(1)
    
    @State var fishbonePosition = CGPoint(x: UIScreen.main.bounds.height/2, y: 300)
    @State var fishboneSize = CGFloat(1)
    
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
                
                VStack{
                    Text("3:00")
                        .bold()
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            self.hatMove()                        }
    
                    }
                
                ForEach(1..<5){ i in
                    Image("StarObj")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: starSize, height: starSize)
                        .position(x:self.starPosition.x + CGFloat(5*i), y: self.starPosition.y + CGFloat(50*i) )
                        .onReceive(self.timer) { _ in
                            let time1: UInt64 = UInt64(i)
                            let time = DispatchTime(uptimeNanoseconds: time1)
                            DispatchQueue.main.asyncAfter(deadline: time){
                                self.starMove()
                            }
                    }
                }
                

                
                Image("FishboneObj")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: fishboneSize, height: fishboneSize)
                    .position(self.fishbonePosition)
                    .onReceive(self.timer) { _ in
                        self.fishboneMove()
                    }
                
                PauseButtonView(sheetIsActive: $pauseIsActive)
                    .padding(.top, 60)
                
                if pauseIsActive {
                    PauseMenuSheet(sheetIsActive: $pauseIsActive)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
                        .onReceive(self.timer){ _ in
//                            self.collisionDetection()
//                            updateScreenSize(w: geo.size.width, h: geo.size.height)
                            self.screenWidth = geo.size.width
                            self.screenHeight = geo.size.height
                            
                            
                        }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
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
        if (self.screenHeight - 130) > self.hatPosition.y{
            withAnimation{
                self.crossPosition.x -= 2.0
                self.crossPosition.y += 4.5
                self.crossSize += 0.85
            }
        } else {
            HapticManager.instance.impact(style: .soft)
            self.points -= 10
            self.crossPosition.x = 200
            self.crossPosition.y = 300
            self.crossSize = 1
        }
    }
    
    func hatMove() {
        if (self.screenHeight - 100) > self.hatPosition.y{
            withAnimation{
                self.hatPosition.x -= 0.5
                self.hatPosition.y += 5
                self.hatSize += 0.8
            }
        } else {
            HapticManager.instance.impact(style: .light)
            self.points -= 10
            self.hatPosition.x = 200
            self.hatPosition.y = 300
            self.hatSize = 1
        }
    }
    func starMove() {
        if (self.screenHeight - 100) > self.starPosition.y{
            withAnimation{
                self.starPosition.x += 0.5
                self.starPosition.y += 5
                self.starSize += 0.8
            }
        } else {
            HapticManager.instance.impact(style: .light)
            self.points -= 10
            self.starPosition.x = 200
            self.starPosition.y = 300
            self.starSize = 1
        }
    }
    func fishboneMove() {
        if (self.screenHeight - 130) > self.hatPosition.y{
            withAnimation{
                self.fishbonePosition.x += 1.8
                self.fishbonePosition.y += 4
                self.fishboneSize += 0.85
            }
        } else {
            HapticManager.instance.impact(style: .soft)
            self.points -= 10
            self.fishbonePosition.x = 200
            self.fishbonePosition.y = 300
            self.fishboneSize = 1
        }
    }
}