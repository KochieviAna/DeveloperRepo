//
//  HoldView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct HoldView: View {
    @StateObject private var viewModel = HoldViewModel()
    
    var body: some View {
        ZStack {
            backgroundColor
            
            GeometryReader { geometry in
                let rect = geometry.frame(in: .local)
                let center = CGPoint(x: rect.midX, y: rect.midY)
                let radius = min(rect.width, rect.height) / 2
                
                ZStack {
                    ForEach(viewModel.sections.indices, id: \.self) { index in
                        let startAngle = Angle(degrees: Double(index) / Double(viewModel.sections.count) * 360)
                        WheelSection(
                            sectionName: viewModel.sections[index].0,
                            startAngle: startAngle,
                            totalSections: viewModel.sections.count,
                            color: viewModel.selectedSection == index ? .gray : viewModel.sections[index].1
                        )
                        .opacity(viewModel.showOutlineOnly ? 0 : 1)
                        .overlay(
                            WheelSectionOutline(
                                startAngle: startAngle,
                                totalSections: viewModel.sections.count,
                                center: center,
                                radius: radius
                            )
                            .stroke(Color.black, lineWidth: 2)
                        )
                        .onTapGesture {
                            viewModel.selectSection(index: index)
                        }
                    }
                }
                .gesture(
                    LongPressGesture(minimumDuration: 5)
                        .onEnded { _ in
                            viewModel.toggleOutlineOnly(true)
                        }
                        .sequenced(before: DragGesture(minimumDistance: 0))
                        .onEnded { _ in
                            viewModel.toggleOutlineOnly(false)
                        }
                )
            }
            .frame(width: 300, height: 300)
        }
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
}

#Preview {
    HoldView()
}
