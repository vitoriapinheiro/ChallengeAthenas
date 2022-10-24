//
//  LevelArray.swift
//  ChallengeAthenas
//
//  Created by gabrielfelipo on 24/10/22.
//

import Foundation
import SwiftUI

struct LevelArray {
    let levels: [Level] = [level1]
}
    var level1: Level = Level(title: "Marco Zero", bossName: "Mofia", bossImage: Image("Morfia"), background: Image("marcoZeroBg"),
        dialogueArray:
        [
        "Finalmente tô conhecendo as atrações de Recife! Que lugar lindo…",
        "(Tem muito kpopper aqui também…)",
        "...",//Pan-out pra vista do parque das esculturas. Foco na AUSÊNCIA de pica!
        "Parece ter algo errado… Essa vista tá tão vazia…",
        "Pois é, nem sempre foi assim.",
        "...",//Tela vira pra mostrar Morfia, a kpopper das profecias.
        "Opa! Quem é você?",
        "Meu nome é Morfia, e você é quem eu procuro. ",
        "EU?! Mas eu nem te conheço, acabei de chegar aqui!",
        "Acredite, foi profetizado que você iria chegar. As profecias dizem: a primeira pessoa que sentir a falta da magnífica kajfbkdj de Brennand será o herói que a resgatará.",
        "Ah, acho que eu conheço essa akskask de Brennand. Devo ter visto em alguma foto. Como algo tão grande pode ter sumido? Como irei salvá-la?",
        "Meu papel é te guiar. Temos inimigos poderosos que você já já vai conhecer… Mas agora… venha treinar comigo!",
        "Vish maria… Onde eu me meti?",
        // Briga com Morfia. Algum banner aparece
        "Aqui em Recife, brigamos com passinho. Vou te ensinar a dançar, você tem cara de que tem um gingado escondido aí!"
        // Mostra a tela do jogo
        ]
        ,speakerArray: [true,true,true,true,false,false,true,false,true,false,true,false,true,false]
        ,dialogueColor: Color(red: 0.00, green: 0.60, blue: 0.40))

