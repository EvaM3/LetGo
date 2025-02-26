//
//  InformationView.swift
//  LetGo
//
//  Created by Eva Madarasz on 26/02/2025.
//

import SwiftUI


struct InformationView: View {
    @StateObject private var animator = CircleAnimator()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background Color
                Color(red: 0.0228, green: 0.1800, blue: 0.1067)
                    .ignoresSafeArea(edges: .all)

                // Glow
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position, color: circle.color)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("How LetGo can help you:")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)

                        Text("Radical Acceptance is about embracing reality as it is, without judgment or resistance. Emotional Detachment allows us to step back from overwhelming emotions, gaining clarity and peace.")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))

                        Divider()
                            .background(Color.white.opacity(0.3))

                
                        Text("🔹 The 'Let Them' Theory")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("The 'Let Them' approach is based on the idea of **allowing people to be who they are, without forcing or controlling them**. This philosophy suggests that trying to change or control others often leads to frustration and resistance. Instead, accepting people’s actions and choices for what they are can bring inner peace.")
                            .foregroundColor(.white.opacity(0.9))

                        Divider()
                            .background(Color.white.opacity(0.3))

                      
                        Text("🔹 The 'Let Me' Theory")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("The 'Let Me' approach shifts the focus away from what others are doing and towards **what you can control** in your own life. It is about personal responsibility, growth, and self-empowerment.")
                            .foregroundColor(.white.opacity(0.9))

                        Divider()
                            .background(Color.white.opacity(0.3))

                   
                        Text("✋ What is EFT Tapping?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("EFT (Emotional Freedom Technique) tapping is a **self-help practice** that involves gently tapping on specific acupressure points while focusing on emotional distress. It combines **cognitive reframing** with **somatic stimulation** to help release negative emotions and stress.")
                            .foregroundColor(.white.opacity(0.9))

                        Text("✅ **Why EFT Works:**")
                            .font(.headline)
                            .foregroundColor(.white)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("✔️ Lowers cortisol (stress hormone) levels.")
                            Text("✔️ Reprograms emotional responses by calming the nervous system.")
                            Text("✔️ Helps process unresolved emotions in a safe way.")
                            Text("✔️ Encourages **self-acceptance and inner balance**.")
                        }
                        .foregroundColor(.white.opacity(0.9))

                        Divider()
                            .background(Color.white.opacity(0.3))

                        Text("🔄 How to Practice EFT Tapping")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("Follow these **5 simple steps** to use EFT tapping for acceptance and emotional detachment:")
                            .foregroundColor(.white.opacity(0.9))

                        VStack(alignment: .leading, spacing: 15) {
                            Text("**1️⃣ Identify the Emotion:**")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Recognize what you’re feeling (e.g., sadness, frustration, anxiety).")
                                .foregroundColor(.white)

                            Text("**2️⃣ Rate the Intensity:**")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("On a scale of 1 to 10, how strong is this emotion?")
                                .foregroundColor(.white)

                            Text("**3️⃣ Create a Setup Statement:**")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Start by tapping on the **karate chop point (side of the hand)** while saying:")
                                .foregroundColor(.white)
                            Text("👉 *'Even though I feel [emotion], I deeply and completely accept myself.'*")
                                .foregroundColor(.white)

                            Text("**4️⃣ Tap on Acupressure Points:**")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Tap gently 5-7 times on each point while repeating a reminder phrase (e.g., 'I feel this emotion, but I let it go.')")
                                .foregroundColor(.white)

                            VStack(alignment: .leading) {
                                Text("✔️ **Eyebrow (EB)** – Start of the eyebrow")
                                Text("✔️ **Side of the Eye (SE)** – Bone beside the eye")
                                Text("✔️ **Under Eye (UE)** – Below the eye")
                                Text("✔️ **Under Nose (UN)** – Between nose and lips")
                                Text("✔️ **Chin (CH)** – Below the lips")
                                Text("✔️ **Collarbone (CB)** – Just below the collarbone")
                                Text("✔️ **Under Arm (UA)** – About 4 inches under the armpit")
                                Text("✔️ **Top of Head (TH)** – Crown of the head")
                            }
                            .foregroundColor(.white.opacity(0.9))

                            Text("**5️⃣ Reassess the Intensity:**")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("After one round, re-rate the emotional intensity. Repeat if needed.")
                                .foregroundColor(.white)
                                
                        }

                        Divider()
                            .background(Color.white.opacity(0.3))

                     // Move this up to the top later, add links, search for more books
                        Text("📚 Recommended Books")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        VStack(alignment: .leading, spacing: 15) {
                            Text("1. *The Tapping Solution* by Nick Ortner")
                            Text("2. *EFT for Beginners* by Thea Westra")
                            Text("3. *Tapping Into Wealth* by Margaret Lynch")
                        }
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))

                        Divider()
                            .background(Color.white.opacity(0.3))

            
                        Text("💡 Additional Resources")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("• Guided EFT meditations.\n• Journaling prompts for emotional detachment.\n• Video tutorials for tapping techniques.")
                            .foregroundColor(.white.opacity(0.9))

                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Information")
    }
}

#Preview {
    InformationView()
}
