//
//  SpinView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct SpinView: View {
    @StateObject private var viewModel = SpinViewModel()
    
    var body: some View {
        ZStack {
            backgroundColor
            
            Circle()
                .strokeBorder(lineWidth: 4)
                .frame(width: 300, height: 300)
                .overlay(
                    ForEach(0..<viewModel.sectionNames.count, id: \.self) { index in
                        let angle = Angle(degrees: Double(index) * (360.0 / Double(viewModel.sectionNames.count)))
                        WheelSection(
                            sectionName: viewModel.sectionNames[index],
                            startAngle: angle,
                            totalSections: viewModel.sectionNames.count,
                            color: viewModel.sectionColors[index % viewModel.sectionColors.count]
                        )
                    }
                )
                .rotationEffect(Angle(degrees: viewModel.rotationAngle))
            
            Circle()
                .fill(Color.primaryWhite)
                .frame(width: 30, height: 30)
            
            Triangle()
                .fill(Color.red)
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -150)
                .shadow(radius: 10)
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height > 50 && !viewModel.isSpinning {
                        viewModel.startSpin()
                    }
                }
        )
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
}

#Preview {
    SpinView()
}
