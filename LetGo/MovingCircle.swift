//
//  MovingCircle.swift
//  LetGo
//
//  Created by Eva Sira Madarasz on 12/02/2025.
//

// MARK: - Moving Background Circles
import SwiftUI

struct MovingCircle: View {
    var originOffset: CGPoint
    var color: Color

    var body: some View {
        GeometryReader { geo in
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.8)
                .position(
                    x: geo.size.width * originOffset.x,
                    y: geo.size.height * originOffset.y
                )
                .blur(radius: 80)
        }
    }
}

class CircleAnimator: ObservableObject {
    class Circle: Identifiable {
        var position: CGPoint
        let id = UUID().uuidString
        let color: Color
        
        init(position: CGPoint, color: Color) {
            self.position = position
            self.color = color
        }
    }
    
    @Published private(set) var circles: [Circle] = []
    
    private let colors: [Color] = [
        Color(red: 0.1, green: 0.4, blue: 0.3),
        Color(red: 0.2, green: 0.7, blue: 0.5),
        Color(red: 0.1, green: 0.6, blue: 0.4),
        Color(red: 0.3, green: 0.8, blue: 0.6),
        Color(red: 0.6, green: 0.9, blue: 0.8)
    ]
    
    init() {
        circles = colors.map { color in
            Circle(position: CircleAnimator.generateRandomPosition(), color: color)
        }
        startAnimationLoop()
    }
    
    private func startAnimationLoop() {
        Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 3.5)) {
                for circle in self.circles {
                    circle.position = CircleAnimator.generateRandomPosition()
                }
            }
        }
    }

    static func generateRandomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0.2...0.8), y: CGFloat.random(in: 0.2...0.8))
    }
}

