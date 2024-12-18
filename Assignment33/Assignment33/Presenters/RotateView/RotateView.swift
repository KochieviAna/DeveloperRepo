//
//  RotateView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct RotateView: View {
    @State var angle = Angle(degrees: 0)
    
    var body: some View {
        ZStack {
            backgroundColor
            
            calculatorImage
                .rotationEffect(angle)
                .gesture(
                    RotationGesture()
                        .onChanged { angle = $0 }
                        .onEnded { angle = $0 }
                )
        }
    }
    
    private var calculatorImage: some View {
        Image("calculator")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
}

#Preview {
    RotateView()
}
