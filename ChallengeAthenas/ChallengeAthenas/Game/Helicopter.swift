//
//  Helicopter.swift
//  ChallengeAthenas
//
//  Created by vivi on 31/10/22.
//

import Foundation
import SwiftUI

struct HelicopterView: View {
    @State private var heliposition = CGPoint(x: 100, y: 100)
    @State private var obstPosition = CGPoint(x: 1000, y: 300)
    @State private var isPaused: Bool = false
    @State private var score = 0
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Vehicle()
                    .position(self.heliposition)
                    .onReceive(self.timer) { _ in
                        self.gravity()
                    }
                Obstacle()
                    .position(self.obstPosition)
                    .onReceive(self.timer) { _ in
                        self.obstMove()
                    }
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10)
                
                self.isPaused ? Button("Restart"){self.resume()} : nil
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            .gesture(
                TapGesture()
                    .onEnded{
                        withAnimation{
                            self.heliposition.y -= 80
                            self.score += 7
                        }
                        
                    }
            )
            .onReceive(self.timer){ _ in self.collisionDetection()}
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func gravity() {
        withAnimation{
            self.heliposition.y += 10
        }
    }
    
    func obstMove() {
        if self.obstPosition.x > 0 {
            withAnimation{
                self.obstPosition.x -= 20
            }
        } else {
            self.obstPosition.x = 1000
            self.obstPosition.y = CGFloat.random(in: 0...500)
        }
    }
    
    func pause() {
        self.timer.upstream.connect().cancel()
    }
    
    func resume(){
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        self.obstPosition.x = 1000
        self.heliposition = CGPoint(x: 100, y: 100)
        
        self.isPaused = false
        self.score = 0
    }
    
    func collisionDetection(){
        if abs(heliposition.x - obstPosition.x) < (35) && abs(heliposition.y - obstPosition.y) < (125){
            self.isPaused = true
            self.pause()
        }
    }
}
