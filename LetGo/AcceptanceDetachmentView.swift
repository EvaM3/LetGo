//
//  AcceptanceDetachmentView.swift
//  LetGo
//
//  Created by Eva Madarasz

import SwiftUI

struct AcceptanceDetachmentView: View {
    @State private var userReflection = ""
    @State private var emotionLabel = ""
    @State private var reflectionLabel = ""
    @State private var visualizationLabel = ""
    @State private var detachmentVisualization = ""
    @StateObject private var affirmationService = AffirmationAPIMockService()

    private let gradientColors: [Color] = [
        Color(red: 0.1, green: 0.4, blue: 0.3),
        Color(red: 0.2, green: 0.7, blue: 0.5),
        Color(red: 0.1, green: 0.6, blue: 0.4),
        Color(red: 0.3, green: 0.8, blue: 0.6),
        Color(red: 0.6, green: 0.9, blue: 0.8)
    ]

    @StateObject private var animator = CircleAnimator()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Color
                Color(red: 0.0228, green: 0.1800, blue: 0.1067)
                    .ignoresSafeArea(edges: .all)

                // Moving Circles for Ambient Glow
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position, color: circle.color)
                }

                VStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            VStack {
                                Text("Radical Acceptance & Emotional Detachment")
                                    .font(.largeTitle)
                                    .fontDesign(.serif)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .accessibilityIdentifier("acceptanceTitle")

                                Text("Acceptance brings peace. Detachment frees you from emotional overwhelm. Reflect, tap, and visualize your way to emotional freedom.")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white.opacity(0.8))
                                    .padding(.horizontal)
                            }
                            .padding(.top, 40)

                            // Reflection Part
                            VStack(alignment: .leading, spacing: 20) {
                                VStack(alignment: .leading) {
                                    Text("Reflect on What You’re Resisting:")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    TextField("I'm resisting...", text: $reflectionLabel)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .background(Color.white.opacity(0.2))
                                        .cornerRadius(10)
                                        .accessibilityIdentifier("emotionTextField")

//                                    ZStack(alignment: .topLeading) {
//                                        RoundedRectangle(cornerRadius: 10)
//                                            .fill(Color.white.opacity(0.15))
//                                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
//
//
//
//                                        TextEditor(text: $userReflection)
//                                            .frame(height: 100)
//                                            .foregroundColor(.white)
//                                            .background(Color.clear)
//                                            .padding(8)
//                                            .accessibilityIdentifier("reflectionEditor")
//                                    }
                                }

                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Label Your Emotion:")
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    TextField("e.g., Anxiety, Anger, Sadness", text: $emotionLabel)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .background(Color.white.opacity(0.2))
                                        .cornerRadius(10)
                                        .accessibilityIdentifier("emotionTextField")
                                        
                                        Spacer()
                                    Button(action: {
                                        affirmationService.fetchAffirmation(for: emotionLabel)
                                    }) {
                                        Text("Get Affirmation")
                                            .font(.headline)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(LinearGradient(gradient: Gradient(colors: gradientColors.shuffled()), startPoint: .leading, endPoint: .trailing))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .accessibilityIdentifier("getAffirmationButton")
                                }


                                                                // Display Fetched Affirmation
                                                                if let affirmation = affirmationService.affirmation {
                                                                    VStack(alignment: .leading) {
                                                                        Text("Affirmation for You:")
                                                                            .font(.headline)
                                                                            .foregroundColor(.white)

                                                                        Text("“\(affirmation.text)”")
                                                                            .font(.body)
                                                                            .italic()
                                                                            .foregroundColor(.white.opacity(0.9))
                                                                            .padding()
                                                                            .background(Color.white.opacity(0.15))
                                                                            .cornerRadius(10)
                                                                            .accessibilityIdentifier("fetchedAffirmation")
                                                                    }
                                                                    .padding(.horizontal)
                                                                }

                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Visualize Letting Go:")
                                        .font(.headline)
                                        .foregroundColor(.white)

                                    TextField("Letting go of...", text: $visualizationLabel)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                                        )
                                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                                        .frame(height: 50)
                                        .accessibilityIdentifier("visualizationTextField")
                                }



                                                            }
                                                            .padding(.horizontal)

                                                            Spacer(minLength: 30)
                                                        }
                                                        .frame(minHeight: geometry.size.height * 0.8)
                                                    }

                    // Fixed Bottom Button
                    VStack {
                        NavigationLink(destination: TappingSessionView(affirmation: "I accept this moment and let go of my need to control.")) {
                            HStack {
                                Image(systemName: "hand.tap.fill")
                                Text("Start Tapping for Acceptance & Detachment")
                            }
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .accessibilityIdentifier("startTappingAcceptanceButton")

                            .background(
                                LinearGradient(gradient: Gradient(colors: gradientColors.shuffled()), startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20) // Ensures visibility
                    }
                }
                .frame(height: geometry.size.height) // Ensures full screen usage
                .safeAreaInset(edge: .bottom) { Color.clear.frame(height: 80) } // Prevents overlap with TabView
            }
        }
        .navigationTitle("Acceptance & Detachment")
    }
}

#Preview {
    AcceptanceDetachmentView()
}
