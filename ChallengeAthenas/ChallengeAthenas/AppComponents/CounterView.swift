//
//  CounterView.swift
//  ChallengeAthenas
//
//  Created by Bof on 01/11/22.
//

import Foundation
import SwiftUI

struct CounterView: View {
    @State private var timeRemaining = 3
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .ignoresSafeArea(.all)
                .opacity(timeRemaining == 0 ? 0.0 : 0.4)
                .disabled(timeRemaining == 0 ? true : false)
            Text("\(timeRemaining)")
                .foregroundColor(.white)
                .font(.custom("xilosa", size: 48))
                .opacity(timeRemaining == 0 ? 0.0 : 1.0)
                .disabled(timeRemaining == 0 ? true : false)
        }
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}

struct CounterView_Preview: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
