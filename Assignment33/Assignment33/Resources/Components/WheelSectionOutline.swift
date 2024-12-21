//
//  WheelSectionOutline.swift
//  Assignment33
//
//  Created by MacBook on 18.12.24.
//

import SwiftUI

struct WheelSectionOutline: Shape {
    let startAngle: Angle
    let totalSections: Int
    let center: CGPoint
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: startAngle + Angle(degrees: 360.0 / Double(totalSections)),
            clockwise: false
        )
        path.closeSubpath()
        return path
    }
}
