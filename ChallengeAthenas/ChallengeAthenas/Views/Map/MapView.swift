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
            VStack {
                Spacer().frame(height: 16)
                HStack {
                    Spacer().frame(width: 16)
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "house")
                            .foregroundColor(Color.white)
                            .frame(width: 52, height: 52)
                            .background(Color(red: 0.90, green: 0.39, blue: 0.00))
                            .cornerRadius(30)
                    }
                    Spacer()
                }
                Spacer()
            }
            NavigationLink(destination: BeachView(level: $level)) {
                Text("1")
                    .font(.custom("xilosa", size: 32))
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
                    NavigationLink(destination: MangrooveView(level: $level)) {
                        Text("2")
                            .font(.custom("xilosa", size: 32))
                            .frame(width:44, height:44)
                            .foregroundColor(level == 1 ? Color.white : Color.black)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
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
                        .font(.custom("xilosa", size: 32))
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
                MediumSheet(showPopUp: $showPopUp, imageName: "luaPreta", title: "PRO\nFUTURO", details: "Tamo trabalhando em coisa massa pra tu! Fica de olho...")
            }
            if notYetLevel {
                SmallSheet(notYetLevel: $notYetLevel, title: "NÍVEL BLOQUEADO", details: "Tu tem que comer muito feijão pra chegar aqui... Termina teus níveis anteriores.")
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

