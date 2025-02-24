//
//   HapticManager.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 30/01/2025.
//


import UIKit

struct HapticManager {
    static func triggerLightImpact() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
}

