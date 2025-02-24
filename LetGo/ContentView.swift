//
//  ContentView.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            LetThemView()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("Let Them")
                }

            LetMeView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Let Me")
                }

            AcceptanceDetachmentView()
                .tabItem {
                    Image(systemName: "wind")
                    Text("Acceptance")
                }

            ProgressView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Progress")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    ContentView()
}
