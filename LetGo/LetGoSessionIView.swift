//
//  LetGoSessionIView.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 22/01/2025.
//

import SwiftUI

struct LetGoSessionView: View {
    let scenarios = [
        "Let them judge you.",
        "Let them walk away.",
        "Let them have their opinions."
    ]
    @State private var selectedScenario = "Let them judge you."
    @State private var userReflection = ""
    @State private var gratitude = ""
    @State private var isTapping = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Scenario Picker
                    Text("LetGo Session")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()

                    Text("Choose a scenario to reflect on and release emotional blocks.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Picker("Choose a Scenario", selection: $selectedScenario) {
                        ForEach(scenarios, id: \.self) { scenario in
                            Text(scenario)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()

                    // Reflection Section
                    Text("Reflect on this:")
                        .font(.headline)

                    TextEditor(text: $userReflection)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                        .cornerRadius(5)
                        .padding()

                    // Tapping Section
                    Text("Tapping Affirmation:")
                        .font(.headline)

                    Text("Even though I feel this, I deeply and completely accept myself. \(selectedScenario)")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                    Circle()
                        .fill(Color.blue.opacity(0.7))
                        .frame(width: 100, height: 100)
                        .scaleEffect(isTapping ? 1.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: isTapping)
                        .onAppear { isTapping = true }

                    // Visualization Section
                    Text("Visualize letting go:")
                        .font(.headline)
                        .padding(.top)

                    Image(systemName: "wind")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.green)
                        .padding()

                    // Gratitude Section
                    Text("What are you grateful for today?")
                        .font(.headline)

                    TextEditor(text: $gratitude)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                        .cornerRadius(5)
                        .padding()

                    // Completion Button
                    Button(action: {
                        // Handle session completion
                    }) {
                        Text("Complete Session")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("LetGo Session")
        }
    }
}


#Preview {
    LetGoSessionView()
}
