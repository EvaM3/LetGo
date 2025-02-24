//
//  HomeView.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.

import SwiftUI



import SwiftUI

struct HomeView: View {
    @ObservedObject private var animator = CircleAnimator()

    var body: some View {
        ZStack {
            // Background Color
            Color(red: 0.0228, green: 0.1800, blue: 0.1067)
                .edgesIgnoringSafeArea(.all)

            // Moving Circles for Ambient Glow
            ForEach(animator.circles) { circle in
                MovingCircle(originOffset: circle.position, color: circle.color)
                    .opacity(0.8)
            }
            .blur(radius: 90)

            VStack(spacing: 80) {
                VStack {
                    Text("Welcome to LetGo")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text("Explore different paths to emotional freedom: release control, embrace empowerment, and heal from within.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal, 40)
                }

                Spacer()

                VStack(spacing: 15) {
                    NavigationLink(destination: LetThemView()) {
                        Text("Start 'Let Them' Session")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: GradientColors.all), startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }

                    NavigationLink(destination: LetMeView()) {
                        Text("Explore 'Let Me' Empowerment")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: GradientColors.all.reversed()), startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }

                    NavigationLink(destination: AcceptanceDetachmentView()) {
                        Text("Radical Acceptance & Detachment")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(gradient: Gradient(colors: GradientColors.all.shuffled()), startPoint: .leading, endPoint: .trailing)
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
    }
}

#Preview {
    HomeView()
}
