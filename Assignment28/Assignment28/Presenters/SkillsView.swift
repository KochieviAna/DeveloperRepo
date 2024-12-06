//
//  SkillsView.swift
//  Assignment28
//
//  Created by MacBook on 06.12.24.
//

import SwiftUI

struct SkillsView: View {
    @State var skill: String
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 5)
                .foregroundStyle(Color("primaryWhite")).opacity(0.8)
                .padding(.trailing, 10)
            
            Text(skill)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(Color("primaryWhite")).opacity(0.8)
        }
    }
}

#Preview {
    SkillsView(skill: "SwiftUI")
}
