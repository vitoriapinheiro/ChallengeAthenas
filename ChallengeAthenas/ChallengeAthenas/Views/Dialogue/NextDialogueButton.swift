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
    @ObservedObject var actualLevel: ActualLevel
    
    var body: some View {

        Image("nextButtonDialogue")
            .onTapGesture {
                if dialoguePosition.position < LevelArray().levels[actualLevel.level].dialogueArray.count - 1 {
                    dialoguePosition.position += 1
                }
                else{
                    dialoguePosition.position = 0
                    actualLevel.level += 1
                }
            }
    }
}
