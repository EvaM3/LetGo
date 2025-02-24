//
//  LetThemIView.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.


import SwiftUI

struct LetThemView: View {
    let scenarios = [
        "Let them judge you.",
        "Let them walk away.",
        "Let them have their opinions.",
        "Let them misunderstand you."
    ]

    @State private var selectedScenario = "Let them judge you."
    @State private var userReflection = ""

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

            VStack(spacing: 20) {
                VStack {
                    Text("The 'Let Them' Philosophy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        

                    Text("Release the need to control others and embrace peace through acceptance.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.horizontal)
                }
                .padding(.top, 40)

                VStack {
                    Text("Choose a Scenario")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

                    // Scenario Selection Menu
                    Menu {
                        ForEach(scenarios, id: \.self) { scenario in
                            Button(action: {
                                selectedScenario = scenario
                            }) {
                                Text(scenario)
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedScenario)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }

                VStack(alignment: .leading) {
                    Text("Reflect on this:")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top)

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.15))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)

                        TextEditor(text: $userReflection)
                            .frame(height: 150)
                            .foregroundColor(.white)
                            .padding(8)
                    }
                    .padding(.horizontal)
                }

                NavigationLink(destination: TappingSessionView(affirmation: selectedScenario)) {
                    HStack {
                        Image(systemName: "hand.tap.fill")
                        Text("Start Tapping for This Scenario")
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
        .navigationTitle("Let Them")
    }
}

#Preview {
    LetThemView()
}
