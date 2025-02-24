//
//  BlurView.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 30/01/2025.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.1) 
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}


