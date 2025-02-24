//
//  SoundManager.swift
//  LetGo
//
//  Created by Eva Madarasz
//

import UIKit
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    func playTransitionSound() {
        guard let url = Bundle.main.url(forResource: "soft-chime", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.5 // Soft sound
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
