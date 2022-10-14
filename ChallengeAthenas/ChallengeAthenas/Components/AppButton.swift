//
//  AppButton.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct AppButton: View {
    let title: String
    let action: () -> Void
    let enable: Bool
    let isFill: Bool
    
    var body: some View {
        Button(action: {
            if enable {
                action()
            }
        }, label: {
            Text(title)
                .bold()
                .foregroundColor(isFill ? Color.white : Color.pink)
                .frame(width: 300, height: 52)
                .background(isFill ? (enable ? Color.pink: Color.gray) : Color.white.opacity(0))
                .cornerRadius(8)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
        )
    }
}
