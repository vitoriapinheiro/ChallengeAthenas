//
//  LifeBar.swift
//  ChallengeAthenas
//
//  Created by Bof on 31/10/22.
//

import Foundation
import SwiftUI

struct Lifebar: View {
    @Binding var status: Double
    
    var width: Int = 304/100
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .background(.pink)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*(96/855))
                .opacity(status > 116 ? 0.24 : 0.5)
            HStack {
                VStack {
                    withAnimation{
                        Image(status > 116 ? "full-heart" : "weak-heart")
                    }
                    Text("vida")
                        .foregroundColor(.white)
                        .font(.custom("xilo-sans", size: 20))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: 304, height:40)
                        .foregroundColor(.white)
                        .opacity(0.4)
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: CGFloat(status), height:40, alignment: .leading)
                        .foregroundColor(.red)
                        .opacity(1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 304-status))
                }
            }
        }
    }
}
