//
//  GlassmorphicBackground.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 30/01/2025.
//

import SwiftUI

struct GlassmorphicBackground: View {
    var body: some View {
        Rectangle()
            .fill(Color.white.opacity(0.1))
            .background(.ultraThinMaterial)
            .blur(radius: 10)
            .cornerRadius(20)
            .padding(20)
    }
}
#Preview {
    GlassmorphicBackground()
}
