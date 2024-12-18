//
//  SpinViewModel.swift
//  Assignment33
//
//  Created by MacBook on 18.12.24.
//

import SwiftUI

class SpinViewModel: ObservableObject {
    @Published var rotationAngle: Double = 0.0
    @Published var isSpinning = false
    
    let sections = [
        ("Gift Card", Color.orange),
        ("Vacation", Color.yellow),
        ("iPhone", Color.green),
        ("House", Color.blue),
        ("MacBook", Color.indigo),
        ("Car", Color.purple)
    ]
    
    func startSpin() {
        isSpinning = true
        let totalSpin = Double.random(in: 720...1440)
        withAnimation(.easeOut(duration: 3)) {
            rotationAngle += totalSpin
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isSpinning = false
        }
    }
    
    func startSpinWithSpeed(duration: Double, totalSpin: Double) {
        isSpinning = true
        withAnimation(.easeOut(duration: duration)) {
            rotationAngle += totalSpin
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.isSpinning = false
        }
    }
}
