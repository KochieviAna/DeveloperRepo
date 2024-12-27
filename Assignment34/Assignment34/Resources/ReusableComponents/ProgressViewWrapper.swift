//
//  ProgressViewWrapper.swift
//  Assignment34
//
//  Created by MacBook on 25.12.24.
//

import SwiftUI

struct ProgressViewWrapper: UIViewRepresentable {
    @Binding var progress: Double
    
    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.tintColor = .systemBlue
        return progressView
    }
    
    func updateUIView(_ uiView: UIProgressView, context: Context) {
        uiView.progress = Float(progress)
    }
}
