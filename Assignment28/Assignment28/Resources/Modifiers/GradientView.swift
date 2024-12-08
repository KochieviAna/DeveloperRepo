//
//  GradientView.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                Gradient.Stop(color: Color("electricBlue").opacity(0.65), location: 0.0),
                Gradient.Stop(color: Color("primaryPurple").opacity(0.65), location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    GradientView()
}
