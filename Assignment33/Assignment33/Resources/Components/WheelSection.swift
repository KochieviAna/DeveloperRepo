//
//  WheelSection.swift
//  Assignment33
//
//  Created by MacBook on 18.12.24.
//

import SwiftUI

struct WheelSection: View {
    let sectionName: String
    let startAngle: Angle
    let totalSections: Int
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: .local)
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            let midAngle = startAngle + Angle(degrees: 360.0 / Double(totalSections) / 2)
            let textPosition = CGPoint(
                x: center.x + radius * 0.6 * CGFloat(cos(midAngle.radians)),
                y: center.y + radius * 0.6 * CGFloat(sin(midAngle.radians))
            )
            
            ZStack {
                sectionPath(center: center, radius: radius)
                    .fill(color)
                    .shadow(radius: 2)
                
                wheelsectionName
                    .position(textPosition)
            }
        }
    }
    
    private func sectionPath(center: CGPoint, radius: CGFloat) -> Path {
        Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: startAngle + Angle(degrees: 360.0 / Double(totalSections)),
                clockwise: false
            )
        }
    }
    
    private var wheelsectionName: some View {
        Text(sectionName)
            .font(.interSemiBold(size: 15))
            .foregroundColor(.primaryWhite)
            .rotationEffect(startAngle + Angle(degrees: 360.0 / Double(totalSections) / 2))
    }
}

#Preview {
    WheelSection(
        sectionName: "Alice",
        startAngle: .degrees(0),
        totalSections: 6,
        color: .blue
    )
    .frame(width: 300, height: 300)
}
