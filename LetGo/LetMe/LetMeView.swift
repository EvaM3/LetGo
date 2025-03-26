//
//  LetMeInterActive.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 18/03/2025.
//

import SwiftUI



struct LetMeView: View {
    @StateObject var viewModel = LetMeViewModel()
        @StateObject private var animator = CircleAnimator()

        @State private var dailyPrompt = ""
        @State private var selectedMoodIndex = 0
        @State private var selectedMood = "Select Mood"

        @State private var letMeAction = "Tap the button to get a 'Let Me' intention."

        private let moods = [
            "😌 Calm",
            "💪 Empowered",
            "😔 Frustrated",
            "🌀 Confused",
            "🌟 Hopeful",
            "😡 Angry",
            "😞 Disappointed",
            "💔 Heartbroken",
            "🎯 Focused",
            "🎉 Proud of myself",
            "😣 Agitated"
        ]

        private let prompts = [
            "What can I take control of today?",
            "How can I show up for myself this week?",
            "What’s one positive action I can take right now?",
            "What would the most empowered version of me do?",
            "What’s something I can let go of to move forward?",
            "How can I turn a challenge into an opportunity today?"
        ]

        private let letMeActions = [
            "Let me set a boundary today.",
            "Let me give myself grace.",
            "Let me take one brave step.",
            "Let me speak my truth kindly.",
            "Let me pause and reflect before reacting.",
            "Let me stay grounded in the present moment.",
            "Let me choose peace over perfection.",
            "Let me celebrate a small win today.",
            "Let me let go of what I can't control.",
            "Let me ask for what I need.",
            "Let me say no without guilt."
        ]

        private let gradientColors: [Color] = [
            Color(red: 0.1, green: 0.4, blue: 0.3),
            Color(red: 0.2, green: 0.7, blue: 0.5),
            Color(red: 0.1, green: 0.6, blue: 0.4),
            Color(red: 0.3, green: 0.8, blue: 0.6),
            Color(red: 0.6, green: 0.9, blue: 0.8)
        ]

        func affirmationForMood(_ mood: String) -> String {
            switch mood {
            case "😡 Angry":
                return "Let me acknowledge my anger and channel it into something constructive."
            case "😞 Disappointed":
                return "Let me accept what I cannot change and shift my focus forward."
            case "💔 Heartbroken":
                return "Let me hold space for my healing and treat myself gently."
            case "🎯 Focused":
                return "Let me use my clarity and purpose to take aligned action."
            case "🎉 Proud of myself":
                return "Let me celebrate how far I've come and keep growing with pride."
            case "😣 Agitated":
                return "Let me ground myself in the present moment and breathe through discomfort."
            case "😔 Frustrated":
                return "Let me be kind to myself while I grow through this."
            case "🌀 Confused":
                return "Let me find clarity in small steps."
            case "💪 Empowered":
                return "Let me channel this power into positive action."
            case "😌 Calm":
                return "Let me rest in my strength and peace."
            case "🌟 Hopeful":
                return "Let me trust the journey and take one step at a time."
            default:
                return "Let me embrace my power and make positive changes."
            }
        }

        var body: some View {
            ZStack {
                // Background Color
                Color(red: 0.0228, green: 0.1800, blue: 0.1067)
                    .ignoresSafeArea(edges: .all)

                // Ambient Glow Animation
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position, color: circle.color)
                }

                VStack(spacing: 10) {
                    VStack {
                        Text("The 'Let Me' Philosophy")
                            .font(.title)
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
                            .accessibilityIdentifier("letMeTitle")

                        Text("Focus on your actions and mindset to reclaim your personal power.")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal)
                    }
                    .padding(.top, 40)

        
                    // Mood Slider
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Select Your Mood:")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Text(moods[selectedMoodIndex])
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Slider(value: Binding(
                            get: { Double(selectedMoodIndex) },
                            set: { selectedMoodIndex = Int($0) }
                        ), in: 0...Double(moods.count - 1), step: 1)
                        .accentColor(.mint)
                        .padding(.horizontal)

                        Text("“\(affirmationForMood(moods[selectedMoodIndex]))”")
                            .font(.callout)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal)
                    }

                    // Let Me Intention Spinner
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your Empowerment Intention:")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Text("“\(letMeAction)”")
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Button(action: {
                          //  withAnimation(.easeInOut) {
                                letMeAction = letMeActions.randomElement() ?? letMeAction
                            //}
                        }) {
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                Text("Spin Intention")
                            }
                            .font(.footnote)
                            .padding(10)
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }

                    // Daily Prompt + Reflection
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Let Me:")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Button(action: {
                            withAnimation(.easeInOut) {
                                dailyPrompt = prompts.randomElement() ?? ""
                            }
                        }) {
                            HStack {
                                Image(systemName: "lightbulb")
                                Text("Show Daily Prompt")
                            }
                            .font(.footnote)
                            .padding(8)
                            .background(Color.white.opacity(0.15))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        if !dailyPrompt.isEmpty {
                            Text(dailyPrompt)
                                .font(.callout)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                                .transition(.opacity)
                        }

                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.15))
                                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)

                            TextEditor(text: $viewModel.empowermentReflection)
                                .frame(height: 150)
                                .foregroundColor(.white)
                                .padding(8)
                                .accessibilityIdentifier("empowermentEditor")
                        }
                        .padding(.horizontal)
                    }

                    // Tapping Session
                    NavigationLink(destination: TappingSessionView(affirmation: affirmationForMood(selectedMood))) {
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
                        .accessibilityIdentifier("startEmpowermentTappingButton")
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
                }
                .padding()
            }
            .navigationTitle("Let Me")
        }
}
//
//#Preview {
//    LetMeView()
//}


#Preview {
    LetMeView()
}
