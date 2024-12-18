//
//  GestureFrenzyView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct GestureFrenzyView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case 0:
                    SpinView()
                case 1:
                    HoldView()
                case 2:
                    RotateView()
                case 3:
                    TrashView()
                default:
                    Text("Invalid Tab")
                }
            }
            Spacer()
            
            HStack {
                TabBarButton(selectedTab: $selectedTab, index: 0, iconName: "spin", selectedIconName: "selected.spin", label: "Spin")
                
                Spacer()
                
                TabBarButton(selectedTab: $selectedTab, index: 1, iconName: "hold", selectedIconName: "selected.hold", label: "Hold")
                
                Spacer()
                
                TabBarButton(selectedTab: $selectedTab, index: 2, iconName: "rotate", selectedIconName: "selected.rotate", label: "Rotate")
                
                Spacer()
                
                TabBarButton(selectedTab: $selectedTab, index: 3, iconName: "trash", selectedIconName: "selected.trash", label: "Trash")
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(.primaryWhite)
        }
    }
}

#Preview {
    GestureFrenzyView()
}
