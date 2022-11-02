//
//  ContentView.swift
//  ChallengeAthenas
//
//  Created by vivi on 14/10/22.
//tirei ds.store

import SwiftUI

struct ContentView: View {
    @AppStorage("level") var level: Int = 0
    
    var body: some View {
        NavigationView{
            MenuView(level: $level)
            //conflito
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
