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
                        Image("CebruthiusFace")
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
                        }.padding(.bottom, 96)
                    }
                    .frame(width: 366, height: 555)
                }
                .padding(.top, 60)
                
                PauseButtonView(sheetIsActive: $pauseIsActive)
                    .padding(.top, 60)
                
                if pauseIsActive {
                    PauseMenuSheet(sheetIsActive: $pauseIsActive)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            //            .onReceive(self.timer){ _ in self.collisionDetection()}
        }
        .edgesIgnoringSafeArea(.all)
    }
}
