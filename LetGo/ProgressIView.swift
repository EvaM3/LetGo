//
//  ProgressIView.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.
//

import SwiftUI

// Progress View for tracking intensity reductions
struct ProgressView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Progress")
                    .font(.largeTitle)
                    .padding()

                Text("Track your emotional intensity changes over time.")
                    .font(.body)
                    .padding()

                // Placeholder for chart or data visualization
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .cornerRadius(8)

                Spacer()
            }
            .navigationTitle("Progress")
        }
    }
}

#Preview {
    ProgressView()
}
