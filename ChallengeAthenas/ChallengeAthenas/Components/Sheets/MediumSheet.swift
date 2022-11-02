//
//  FutureView.swift
//  ChallengeAthenas
//
//  Created by Bof on 24/10/22.
//
import Foundation
import SwiftUI

struct MediumSheet: View {
    @Binding var showPopUp: Bool
    var imageName: String
    var title: String
    var details: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .onTapGesture {
                                    showPopUp = false
                                }
                .ignoresSafeArea()
            VStack {
                PopUpTitle(text: title, colorPick: false)
                Image(imageName)
                    .fixedSize()
                Text(details)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.custom("xilosa", size: 20))
                    .frame(width: 214, alignment: .center)
                    .padding()

                AppButton(
                    title: "OK, BOY",
                    action: {showPopUp = false},
                    enable: true,
                    isFill: true,
                    height: 48,
                    width: 300,
                    big: true,
                    size: 20
                )
            }
            
        }
        .background(
            Image("big-popup-bg")
                .frame(width: 351, height: 501)
        )
    }
}

//struct MediumSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        MediumSheet(showPopUp: MapView(level: ContentView(level: 0).$level).$showPopUp)
//    }
//}
