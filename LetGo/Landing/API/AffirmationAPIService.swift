//
//  AffirmationAPIService.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 14/03/2025.
//

import Foundation
import SwiftUI


class AffirmationAPIMockService: ObservableObject {
    @Published var affirmation: Affirmation?

    func fetchAffirmation(for emotion: String) {
        // Simulated (mock) response
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.affirmation = Affirmation(text: "You are brave even when you feel \(emotion).")
        }
    }
}
