//
//  HoldView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct HoldView: View {
    @State private var showOutlineOnly = false
    @State private var selectedSection: Int? = nil
    
    let sections = [
        ("Alice", Color.red),
        ("Bob", Color.green),
        ("Charlie", Color.blue),
        ("Daisy", Color.orange),
        ("Eve", Color.purple),
        ("Frank", Color.yellow)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: .local)
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            
            ZStack {
                ForEach(sections.indices, id: \.self) { index in
                    let startAngle = Angle(degrees: Double(index) / Double(sections.count) * 360)
                    WheelSection(
                        sectionName: sections[index].0,
                        startAngle: startAngle,
                        totalSections: sections.count,
                        color: selectedSection == index ? .gray : sections[index].1
                    )
                    .opacity(showOutlineOnly ? 0 : 1)
                    .overlay(
                        WheelSectionOutline(
                            startAngle: startAngle,
                            totalSections: sections.count,
                            center: center,
                            radius: radius
                        )
                        .stroke(Color.black, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedSection = index
                    }
                }
            }
            .gesture(
                LongPressGesture(minimumDuration: 5)
                    .onEnded { _ in
                        showOutlineOnly.toggle()
                    }
            )
        }
        .frame(width: 300, height: 300)
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
}

#Preview {
    HoldView()
}
