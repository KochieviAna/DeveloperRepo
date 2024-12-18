//
//  TabBarButton.swift
//  Assignment33
//
//  Created by MacBook on 18.12.24.
//

import SwiftUI

struct TabBarButton: View {
    @Binding var selectedTab: Int
    let index: Int
    let iconName: String
    let selectedIconName: String
    let label: String
    
    var body: some View {
        VStack {
            Image(selectedTab == index ? selectedIconName : iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                
            Text(label)
                .font(.caption)
                .foregroundColor(selectedTab == index ? .primaryGreen : .primaryGrey)
        }
        .padding()
        .foregroundColor(selectedTab == index ? .primaryGreen : .primaryGrey)
        .onTapGesture {
            selectedTab = index
        }
    }
}

#Preview {
    TabBarButton(selectedTab: .constant(0), index: 0, iconName: "spin", selectedIconName: "selected.spin", label: "Spin")
}

