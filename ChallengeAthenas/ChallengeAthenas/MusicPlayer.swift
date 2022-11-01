//
//  MusicPlayer.swift
//  ChallengeAthenas
//
//  Created by Bof on 01/11/22.
//

import Foundation
import AVFoundation

class MusicPlayer: ObservableObject {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer!
    private var songPlaying: String = ""
    @Published private var playing = false


    func startBackgroundMusic(backgroundMusicFileName: String) {
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: "m4a") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                songPlaying = backgroundMusicFileName
                playing = true
            } catch {
                print(error)
                playing = false
            }
        }
    }
    
    func playPause() {
            if playing {
                audioPlayer.pause()
            } else {
                audioPlayer.play()
            }
            playing.toggle()
        }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        playing = false
        audioPlayer.stop()
    }

}
