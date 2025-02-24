//
//  LoadingView.swift
//  LetGo
//
//  Created by Eva Madarasz on 30/01/2025.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        ZStack {
            if isLoading {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .mint))
                        .scaleEffect(1.5)
                    
                    Text("Loading...")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                .padding(20)
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isLoading)
    }
}

