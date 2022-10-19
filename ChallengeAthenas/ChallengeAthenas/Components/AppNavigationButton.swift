//
//  AppNavigationButton.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//

import Foundation
import SwiftUI

struct AppNavigationButton: View {
    let title: String
    let nextView: () -> AnyView
    let isFill: Bool
    
    var body: some View {
        NavigationLink(
            destination: nextView(),
            label: {
                Text(title)
                    .bold()
                    .foregroundColor(isFill ? Color.white : Color.pink)
                    .frame(width: 300, height: 48)
                    .background(isFill ? Color.pink : Color.white.opacity(0))
                    .cornerRadius(16)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
            }
        )
    }
}
