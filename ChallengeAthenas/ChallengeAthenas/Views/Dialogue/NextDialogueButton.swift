//
//  NextDialogueButton.swift
//  ChallengeAthenas
//
//  Created by gabrielfelipo on 24/10/22.
//

import Foundation
import SwiftUI

struct NextDialogueButton: View {
    @ObservedObject var dialoguePosition: DialoguePosition
    
    var body: some View {

        Image("nextButtonDialogue")
            .onTapGesture {
                if dialoguePosition.position < LevelArray().levels[0].dialogueArray.count - 1 {
                    dialoguePosition.position += 1
                }
            }
    }
}
