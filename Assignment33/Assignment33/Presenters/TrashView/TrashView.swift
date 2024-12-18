//
//  TrashView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct TrashView: View {
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack{
                fileImage
                    .padding(.top, 150)
                
                binImage
                    .padding(.top, 250)
                    .offset(x: 150)
            }
        }
    }
    
    private var backgroundColor: Color {
        .primaryGreen
    }
    
    private var fileImage: some View {
        Image("file")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    private var binImage: some View {
        Image("bin")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    TrashView()
}
