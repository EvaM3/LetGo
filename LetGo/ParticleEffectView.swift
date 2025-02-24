//
//  ParticleEffectView.swift
//  LetGo
//
//  Created by Eva Sira Madarasz 
//

import SwiftUI



struct ParticleEffectView: View {
    @State private var particles: [Particle] = (0..<20).map { _ in Particle() }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(Color.green.opacity(0.4))
                        .frame(width: particle.size, height: particle.size)
                        .position(x: particle.position.x * geo.size.width, y: particle.position.y * geo.size.height)
                        .blur(radius: 8)
                        .animation(Animation.easeInOut(duration: particle.speed).repeatForever(autoreverses: true), value: particle.position)
                }
            }
            .onAppear {
                for i in particles.indices {
                    withAnimation(Animation.easeInOut(duration: particles[i].speed).repeatForever(autoreverses: true)) {
                        particles[i].position = CGPoint(x: .random(in: 0...1), y: .random(in: 0...1))
                    }
                }
            }
        }
    }
}

struct Particle: Identifiable {
    let id = UUID()
    var position: CGPoint = CGPoint(x: .random(in: 0...1), y: .random(in: 0...1))
    var size: CGFloat = CGFloat.random(in: 10...20)
    var speed: Double = Double.random(in: 4...8)
}


#Preview {
    ParticleEffectView()
}
