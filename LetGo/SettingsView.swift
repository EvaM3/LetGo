//
//  SettingsView.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.
//

import SwiftUI

// Settings View for customization
struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .padding()

                Text("Customize your experience.")
                    .font(.body)
                    .padding()

                Spacer()
            }
            .navigationTitle("Settings")
        }
    }
}


#Preview {
    SettingsView()
}
