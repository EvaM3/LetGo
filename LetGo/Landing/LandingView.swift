//
//  LandingView.swift
//  LetGo
//
//  Created by Eva Madarasz
//


import SwiftUI

struct LandingView: View {
   private enum GradientColors {
       static var all: [Color] {
           [
               Color(red: 0.1, green: 0.3, blue: 0.4),  // Deep teal-green
               Color(red: 0.2, green: 0.7, blue: 0.5),  // Soft emerald green
               Color(red: 0.1, green: 0.6, blue: 0.4),  // Northern lights green
               Color(red: 0.3, green: 0.8, blue: 0.6),  // Glowing mint
               Color(red: 0.6, green: 0.9, blue: 0.8)   // Soft cyan glow
           ]
       }
       
       static var backgroundColor: Color {
           Color(red: 0.0228, green: 0.1800, blue: 0.1067)
       }
   }
   
   @State private var navigateToMain = false
   @State private var navigateToInfo = false
   @State private var fadeIn = false
   @State private var glowingText = false
   
   var body: some View {
       NavigationStack {
           ZStack {
               GradientColors.backgroundColor
                   .edgesIgnoringSafeArea(.all)

               VStack(spacing: 30) {
                   Text("Welcome to LetGo")
                       .font(.largeTitle)
                       .fontWeight(.bold)
                       .multilineTextAlignment(.center)
                       .foregroundColor(.white)
                       .opacity(fadeIn ? 1 : 0)
                       .scaleEffect(glowingText ? 1.05 : 1)
                       .shadow(color: Color.green.opacity(0.8), radius: glowingText ? 12 : 0)
                       .accessibilityIdentifier("welcomeText")

                   Text("Explore different paths to emotional freedom: release control, embrace empowerment, and heal from within.")
                       .font(.body)
                       .multilineTextAlignment(.center)
                       .foregroundColor(.white.opacity(0.8))
                       .padding(.horizontal, 40)
                       .opacity(fadeIn ? 1 : 0)
                       .padding(10)
              
                   Button(action: {
                       SoundManager.shared.playTransitionSound()
                       HapticManager.triggerLightImpact()
                       withAnimation(.easeInOut(duration: 1)) {
                           navigateToMain = true
                       }
                   }) {
                       Text("Enter LetGo")
                           .font(.headline)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(
                               LinearGradient(gradient: Gradient(colors: GradientColors.all), startPoint: .leading, endPoint: .trailing)
                           )
                           .foregroundColor(.black)
                           .cornerRadius(10)
                           .shadow(radius: 3)
                           .padding(.horizontal, 40)
                   }
                   .accessibilityIdentifier("enterButton")
                   .opacity(fadeIn ? 1 : 0)
                   // Information Button
                                     Button(action: {
                                         HapticManager.triggerLightImpact()
                                         withAnimation(.easeInOut(duration: 1)) {
                                             navigateToInfo = true
                                         }
                                     }) {
                                         HStack {
                                             Image(systemName: "book.fill")
                                             Text("Learn More About LetGo")
                                         }
                                         .font(.subheadline)
                                         .padding()
                                         .frame(maxWidth: .infinity)
                                         .background(
                                             LinearGradient(gradient: Gradient(colors: GradientColors.all), startPoint: .leading, endPoint: .trailing)
                                         )
                                         .foregroundColor(.black)
                                         .cornerRadius(10)
                                         .padding(.horizontal, 40)
                                     }
                                     .accessibilityIdentifier("learnMoreButton")
                                     .opacity(fadeIn ? 1 : 0)
                                 }
               
               .onAppear {
                   withAnimation(.easeInOut(duration: 1.5)) {
                       fadeIn = true
                   }
                   glowingText = true
               }

               ParticleEffectView()
           }
           .navigationDestination(isPresented: $navigateToMain) {
               MainTabView()
                   .transition(.opacity)
                   .animation(.easeIn(duration: 1), value: navigateToMain)
           }
       // Navigation to Information View
                  .navigationDestination(isPresented: $navigateToInfo) {
                      InformationView()
                          .transition(.opacity)
                          .animation(.easeIn(duration: 1), value: navigateToInfo)
                  }
       }
       .tint(.white)
   }
}

#Preview {
   LandingView()
}
