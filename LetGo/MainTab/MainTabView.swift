//
//  MainTabView.swift
//  LetGo
//
//  Created by Eva  Madarasz 
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.clear
        UITabBar.appearance().barTintColor = UIColor.systemGray5.withAlphaComponent(0.2)
    }
    
    var body: some View {
        
        ZStack {
            GradientColors.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                TabView {
                    LetThemView()
                        .tabItem {
                            Image(systemName: "hands.clap.fill")
                                .resizable()
                                .frame(width: selectedTab == 0 ? 30 : 24, height: selectedTab == 0 ? 30 : 24)
                                .scaleEffect(selectedTab == 0 ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: selectedTab)
                            Text("Let Them")
                        }
                    
                    LetMeView()
                        .tabItem {
                            Image(systemName: "figure.stand")
                                .resizable()
                                .frame(width: selectedTab == 0 ? 30 : 24, height: selectedTab == 0 ? 30 : 24)
                                .scaleEffect(selectedTab == 0 ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: selectedTab)
                            Text("Let Me")
                        }
                    
                    AcceptanceDetachmentView()
                        .tabItem {
                            Image(systemName: "leaf.fill")
                                .resizable()
                                .frame(width: selectedTab == 0 ? 30 : 24, height: selectedTab == 0 ? 30 : 24)
                                .scaleEffect(selectedTab == 0 ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: selectedTab)
                            Text("Acceptance")
                        }
                }
                .accentColor(Color.mint) // Aurora Glow
                .background(GlassmorphicBackground())
            }
        }
    }
}


#Preview {
    MainTabView()
}
