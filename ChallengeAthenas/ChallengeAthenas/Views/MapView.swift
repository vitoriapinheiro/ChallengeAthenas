//
//  MapView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

let backgroundImg = Image("map-bg")

struct MapView: View {
    @Binding var level: Int
    
    @State var showPopUp = false
    @State var notYetLevel = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack{
            Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                Image(systemName: "house")
                    .foregroundColor(Color.white)
                    .frame(width: 52, height: 52)
                    .background(Color.orange)
                    .cornerRadius(30)
            }
            .offset(x: -134, y: -316)
            Button(action: {
                print("0")
            }) {
                Text("1")
                    .frame(width:44, height:44)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .clipShape(Circle())
            }
            .offset(x: -104, y: 282)
            Button(action: level == 1 ?
                   {notYetLevel = false} : {notYetLevel = true}
            ) {
                ZStack {
                    Text("2")
                        .frame(width:44, height:44)
                        .foregroundColor(level == 1 ? Color.white : Color.black)
                        .background(Color.black)
                        .clipShape(Circle())
                    Image("lockIMG")
                        .opacity(level == 1 ? 0: 100)
                }
            }
            .offset(x: 1.5, y: 235)

            Button(action: {
                showPopUp = true
            }) {
                ZStack {
                    Text("3")
                        .frame(width:44, height:44)
                        .foregroundColor(Color.black)
                        .background(Color.black)
                        .clipShape(Circle())
                    Image("lockIMG")
                }
            }
            .offset(x: 46, y: 144)
                
            //            if showPopUp == true {
            //                FutureSheet(sheetIsActive: $showPopUp)
            //            }

            .navigationBarBackButtonHidden(true)
            if showPopUp {
                FutureSheet(showPopUp: $showPopUp)
            }
            if notYetLevel {
                NotYetSheet(notYetLevel: $notYetLevel)
            }
        }
        .background(
            Image("map-bg-\(level)")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

