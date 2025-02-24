//
//  TappingSessionView.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 23/01/2025.
//

import SwiftUI

struct TappingSessionView: View {
    var affirmation: String = "Even though I feel this, I deeply and completely accept myself."
    
    @State private var currentPointIndex = 0
    private let tappingPoints = TappingPoint.allCases

    private let gradientColors: [Color] = [
        Color(red: 0.1, green: 0.4, blue: 0.3),
        Color(red: 0.2, green: 0.7, blue: 0.5),
        Color(red: 0.1, green: 0.6, blue: 0.4),
        Color(red: 0.3, green: 0.8, blue: 0.6),
        Color(red: 0.6, green: 0.9, blue: 0.8)
    ]

    @StateObject private var animator = CircleAnimator()

    var body: some View {
        ZStack {
            // Background Color
            Color(red: 0.0228, green: 0.1800, blue: 0.1067)
                .ignoresSafeArea(edges: .all)

            // Moving Circles for Ambient Glow
            ForEach(animator.circles) { circle in
                MovingCircle(originOffset: circle.position, color: circle.color)
            }

            VStack(spacing: 30) {
                VStack {
                    Text("Affirmation:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(affirmation)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .padding()
                }

                VStack {
                    Text("Current Tapping Point:")
                        .font(.headline)
                        .foregroundColor(.white)

                    Text(tappingPoints[currentPointIndex].rawValue)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()

                    // Tapping Point Animation
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 100, height: 100)
                            .scaleEffect(1.2)
                            .animation(
                                Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true),
                                value: currentPointIndex
                            )

                        Text(tappingPoints[currentPointIndex].rawValue)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }

                Spacer()

                // Navigation Buttons
                HStack(spacing: 20) {
                    Button(action: {
                        if currentPointIndex > 0 {
                            currentPointIndex -= 1
                        }
                    }) {
                        Text("Previous")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }

                    Button(action: {
                        if currentPointIndex < tappingPoints.count - 1 {
                            currentPointIndex += 1
                        }
                    }) {
                        Text("Next")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) } // Prevents overlap with TabView
        }
        .navigationTitle("Tapping Session")
    }
}

#Preview {
    TappingSessionView()
}
