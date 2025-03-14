//
//  LetMeView.swift
//  LetGo
//
//  Created by Eva Madarasz 
//

import SwiftUI

struct LetMeView: View {
    @StateObject var viewModel = LetMeViewModel()
  

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

            //  Ambient Glow
            ForEach(animator.circles) { circle in
                MovingCircle(originOffset: circle.position, color: circle.color)
            }

            VStack(spacing: 20) {
                VStack {
                    Text("The 'Let Me' Philosophy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()

                    Text("Focus on your actions and mindset to reclaim your personal power.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal)
                }
                .padding(.top, 40)

                VStack(alignment: .leading) {
                    Text("Let Me:")
                        .font(.headline)
                        .foregroundColor(.white)

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)

                        TextEditor(text: $viewModel.empowermentReflection)
                       
                            .frame(height: 150)
                            .foregroundColor(.white)
                            .padding(8)
                    }
                    .padding(.horizontal)
                }

                NavigationLink(destination: TappingSessionView(affirmation: "Let me embrace my power and make positive changes.")) {
                    HStack {
                        Image(systemName: "hand.tap.fill")
                        Text("Start Empowerment Tapping")
                    }
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
                .padding(.horizontal)

                Spacer()
            }
            .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) } // Prevents overlap with TabView
            .padding()
        }
        .navigationTitle("Let Me")
    }
}

#Preview {
    LetMeView()
}
