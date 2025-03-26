//
//  LetGoApp.swift
//  LetGo
//
//  Created by Eva Madarasz on 22/01/2025.
//

import SwiftUI

@main
struct LetGoApp: App {
    init() {
        let appearance = UINavigationBarAppearance()

        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.backgroundEffect = nil
       
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().tintColor = .white
    }


    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
}
