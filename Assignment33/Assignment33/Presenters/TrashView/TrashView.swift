//
//  TrashView.swift
//  Assignment33
//
//  Created by MacBook on 17.12.24.
//

import SwiftUI

struct TrashView: View {
    @State private var filePosition = CGSize.zero
    @State private var isDragging = false
    @State private var fileInTrash = false
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack {
                fileImage
                    .padding(.top, 150)
                    .offset(filePosition)
                    .opacity(fileInTrash ? 0 : 1)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.filePosition = value.translation
                            self.isDragging = true
                        }
                        .onEnded { value in
                            self.handleDrop(value: value)
                        }
                    )
                
                binImage
                    .padding(.top, 250)
                    .offset(x: 150)
                    .onDrop(of: [.image], isTargeted: .constant(true)) { providers in
                        self.handleDrop(value: nil)
                        return true
                    }
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
    
    private func handleDrop(value: DragGesture.Value?) {
        if value != nil, value!.location.x > 150 {
            fileInTrash = true
        }
        
        filePosition = .zero
        isDragging = false
    }
}

#Preview {
    TrashView()
}
