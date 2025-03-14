//
//  LetMeViewModel.swift
//  LetGo
//
//  Created by Eva Madarasz
//

import Foundation
import SwiftUI

class LetMeViewModel: ObservableObject {
    @Published var empowermentReflection: String = ""
    
    var affirmationText: String {
        "Let me embrace my power and make positive changes."
    }
}

