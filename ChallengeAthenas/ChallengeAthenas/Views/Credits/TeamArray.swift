//
//  TeamArray.swift
//  ChallengeAthenas
//
//  Created by mvbsa on 27/10/22.
//

import Foundation
import SwiftUI

struct TeamArray {
    static let teamMembers: [Team] = [teamMemberOne, teamMemberTwo, teamMemberThree, teamMemberFour, teamMemberFive]
}

let teamMemberOne: Team = Team(member: "Beatriz Férre", role: "Ilustração de personagens e programadora")
let teamMemberTwo: Team = Team(member: "Gabriel Felipo", role: "designer e programador")
let teamMemberThree: Team = Team(member: "Mª Vitória Bandeira", role: "designer-chefe e programadora")
let teamMemberFour: Team = Team(member: "Thaís Monteiro", role: "Ilustração de Background e programadora")
let teamMemberFive: Team = Team(member: "Vitória Pinheiro", role: "programadora-chefe")
