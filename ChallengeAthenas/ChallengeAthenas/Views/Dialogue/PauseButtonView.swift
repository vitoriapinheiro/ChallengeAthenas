//
//  Pause.swift
//  HellCife
//
//  Created by gabrielfelipo on 18/10/22.
//

import SwiftUI

struct PauseButtonView: View {
    @Binding var sheetIsActive: Bool
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                ZStack{
                    Color.orange
                        .frame(width: 48, height: 48, alignment: .topTrailing)
                        .cornerRadius(30)
                        .onTapGesture {
                            sheetIsActive = true
                        }
                    
                    Image(systemName: "pause.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 18)
                }
                Spacer()
                    .frame(width: 16)
            }
            Spacer()
        }
    }
}
