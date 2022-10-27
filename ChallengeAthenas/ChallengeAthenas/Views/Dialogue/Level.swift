//
//  Levels.swift
//  ChallengeAthenas
//
//  Created by gabrielfelipo on 24/10/22.
//

import Foundation
import SwiftUI

struct Level {
    var title: String
    var bossName: String
    var bossImage: Image
    var background: Image
    var dialogueArray: Array<String>
    var speakerArray: Array<Bool>
    var dialogueColor: Color
}
