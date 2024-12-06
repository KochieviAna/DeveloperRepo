//
//  ContactView.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

struct ContactView: View {
    @State var contactInfo: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40)
                .foregroundStyle(Color("primaryBlack")).opacity(0.2)
                .shadow(color: Color("primaryBlack").opacity(0.2), radius: 1)
            Image(contactInfo)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundStyle(Color("primaryWhite"))
        }
    }
}

#Preview {
    ContactView(contactInfo: "social")
}
