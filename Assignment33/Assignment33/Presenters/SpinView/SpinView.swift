//
//  SpinView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct SpinView: View {
    @StateObject private var viewModel = SpinViewModel()
    @State private var dragOffset: CGFloat = 0
    @State private var spinDuration: Double = 3.0
    @State private var totalSpin: Double = 0.0
    
    var body: some View {
        ZStack {
            backgroundColor
            
            wheel
                .rotationEffect(Angle(degrees: viewModel.rotationAngle))
            
            Circle()
                .fill(Color.primaryWhite)
                .frame(width: 30, height: 30)
            
            triangleImage
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.height
                    
                    let normalizedDistance = min(max(dragOffset, 0), 500)
                    spinDuration = Double(3.0 + (normalizedDistance / 100))
                    totalSpin = Double(normalizedDistance * 2)
                }
                .onEnded { value in
                    if dragOffset > 50 && !viewModel.isSpinning {
                        viewModel.startSpinWithSpeed(duration: spinDuration, totalSpin: totalSpin)
                    }
                    dragOffset = 0
                }
        )
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
    
    private var wheel: some View {
        Circle()
            .strokeBorder(lineWidth: 4)
            .frame(width: 300, height: 300)
            .overlay(
                ForEach(0..<viewModel.sections.count, id: \.self) { index in
                    let angle = Angle(degrees: Double(index) * (360.0 / Double(viewModel.sections.count)))
                    let section = viewModel.sections[index]
                    WheelSection(
                        sectionName: section.0,
                        startAngle: angle,
                        totalSections: viewModel.sections.count,
                        color: section.1
                    )
                }
            )
    }
    
    private var triangleImage: some View {
        Image(systemName: "triangle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: 180))
            .offset(y: -150)
            .shadow(radius: 10)
            .foregroundStyle(.red)
    }
}

#Preview {
    SpinView()
}
