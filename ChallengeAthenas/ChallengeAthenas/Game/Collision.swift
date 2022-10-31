//
//  Collision.swift
//  ChallengeAthenas
//
//  Created by vivi on 28/10/22.
//

import Foundation
import SwiftUI

struct ColisionView: View {
    @State var x1: CGFloat = 100
    @State var y1: CGFloat = 100
    
    @State var x2: CGFloat = 200
    @State var y2: CGFloat = 200
    
    @State var collision: Bool = false
    @State var score: String = ""
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
                .position(x: self.x1, y: self.y1)
            
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .position(x: self.x2, y: self.y2)
                .gesture(
                    DragGesture()
                        .onChanged({
                            value in
                            self.x2 = value.location.x
                            self.y2 = value.location.y
                            self.checkCollision()
                        })
                )
            self.collision ? Text("Bateu, boy \n Score: \(score)").bold(): nil
            
        }
    }
    
    func checkCollision () {
        let s1 = abs(self.x1 - self.x2)
        let s2 = abs(self.y1 - self.y2)
        
        if s1 < 70 && s2 < 70 {
            self.collision = true
            
            if(s1+s2) < 5 {
                self.score = "PERFEITO"
            } else if (s1+s2) < 30 {
                self.score = "UAUUU"
            } else if (s1+s2) < 60 {
                self.score = "TOP D+"
            } else if (s1+s2) < 80 {
                self.score = "TOP"
            } else if (s1+s2) < 100 {
                self.score = "Muito bem"
            } else if (s1+s2) < 120 {
                self.score = "Boa"
            } else {
                self.score = "legalzinho"
            }
            
            
        } else {
            self.collision = false
        }
    }
    
}

