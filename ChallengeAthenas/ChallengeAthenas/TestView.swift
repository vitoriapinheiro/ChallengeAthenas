//
//  TestView.swift
//  ChallengeAthenas
//
//  Created by Bof on 01/11/22.
//

import Foundation
import SwiftUI

struct TestView: View {
    var body: some View {
        VStack{
            Text("oi")
            Image(systemName:"star.fill")
                .onTapGesture {
                    MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "Ataque do Carangueijo")
                }
            Image(systemName: "globe")
                .onTapGesture {
                    MusicPlayer.shared.playPause()
                }
        }
    }
}

struct TestView_Preview: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
