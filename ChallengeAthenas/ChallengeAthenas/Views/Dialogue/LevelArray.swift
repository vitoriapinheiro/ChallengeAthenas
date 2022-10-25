//
//  LevelArray.swift
//  ChallengeAthenas
//
//  Created by gabrielfelipo on 24/10/22.
//

import Foundation
import SwiftUI

struct LevelArray {
    let levels: [Level] = [level1, level2, level3]
}
    var level1: Level = Level(title: "1º Círculo: Marco Zero", bossName: "Mofia", bossImage: Image("Morfia"), background: Image("Marco"),
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
        "Aqui em Recife, brigamos com passinho. Vou te ensinar a dançar, você tem cara de que tem um gingado escondido aí!",
        // Mostra a tela do jogo
        //Cabou a briga
        "Pronto, agora tá no grau! Você sabe meter o passinho. Vamo simbora resgatar a jjnfakjdn de Brennand!",
        "É aqui que ficava a csnkcdnv, né?",
        "Sim… agora temos essa longa escada que ninguém se atreve a adentrar. É um portal para o reino dos nossos inimigos, os ladrões… para Hellcife!",
        "Meu Jesus, não achei que fosse tão sério…",
        "Mas É, herói… E agora, o destino de Recife está em suas mãos…",
        //Morfia empurra
        //Tela escura
        "dnfnfkwnn!IKN2nkn4342",
        "…",
        "… onde estou?"
        ]
        ,speakerArray: [true,true,true,true,false,false,true,false,true,false,true,false,true,false,false,true,false,true,false,true,true,true]
        ,dialogueColor: Color(red: 0.00, green: 0.60, blue: 0.40))

var level2: Level = Level(title: "2º Círculo: Boa Viagem", bossName: "Cebruthius", bossImage: Image("Cebruthius"), background: Image("Praia"),
        dialogueArray:
        ["Meu Deus… parece a praia de Boa Viagem, mas...",
         "Cebruuuuuuuuuuuuthius! Quem ousa invadir meu círculo de Hellcife?", // Aparece Cebruthius
         "!!!!",
         "Espero que tu saiba meter o passinho!",
         //Briga
         "Que loucura. Mas parece que eu levo jeito…"
        ]
        ,speakerArray: [true,false,true,false,true]
        ,dialogueColor: Color(red: 0.00, green: 0.53, blue: 0.60))

var level3: Level = Level(title: "3º Círculo: Via Mangue", bossName: "Mangue Boy", bossImage: Image("MangueBoy"), background: Image("Mangue"),
        dialogueArray:
        ["Qué isso boy? Veio trazer caos pra minha lama?",
         "Ha! Vamo ver quem é que tira a maior braba…",
         //Briga
         "Esqueça tudo!"
        ]
        ,speakerArray: [false,true,true]
        ,dialogueColor: Color(red: 0.00, green: 0.50, blue: 0.34))
