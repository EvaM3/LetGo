//
//  GradientColors.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 30/01/2025.
//

import UIKit

import SwiftUI

 enum GradientColors {
    static var all: [Color] {
        [
            Color(red: 0.1, green: 0.4, blue: 0.3),  // Deep teal-green
            Color(red: 0.2, green: 0.7, blue: 0.5),  // Soft emerald green
            Color(red: 0.1, green: 0.6, blue: 0.4),  // Northern lights green
            Color(red: 0.3, green: 0.8, blue: 0.6),  // Glowing mint
            Color(red: 0.6, green: 0.9, blue: 0.8)   // Soft cyan glow
        ]
    }
    
    static var backgroundColor: Color {
        Color(red: 0.0228, green: 0.1800, blue: 0.1067)  // Darker green background
    }
}

