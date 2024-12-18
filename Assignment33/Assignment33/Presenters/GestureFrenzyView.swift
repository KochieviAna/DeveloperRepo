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
        TabView(selection: $selectedTab) {
            SpinView()
                .tabItem {
                    Label("Spin", image: selectedTab == 0 ? "selected.spin" : "spin")
                        .foregroundColor(selectedTab == 0 ? .primaryGreen : .primaryGrey)
                }
                .tag(0)
            
            HoldView()
                .tabItem {
                    Label("Hold", image: selectedTab == 1 ? "selected.hold" : "hold")
                        .foregroundColor(selectedTab == 1 ? .primaryGreen : .primaryGrey)
                }
                .tag(1)
            
            RotateView()
                .tabItem {
                    Label("Rotate", image: selectedTab == 2 ? "selected.rotate" : "rotate")
                        .foregroundColor(selectedTab == 2 ? .primaryGreen : .primaryGrey)
                }
                .tag(2)
            
            TrashView()
                .tabItem {
                    Label("Trash", image: selectedTab == 3 ? "selected.trash" : "trash")
                        .foregroundColor(selectedTab == 3 ? .primaryGreen : .primaryGrey)
                }
                .tag(3)
        }
        .accentColor(.primaryGreen)
    }
}

#Preview {
    GestureFrenzyView()
}
