//
//  Assignment35App.swift
//  Assignment35
//
//  Created by MacBook on 27.12.24.
//

import SwiftUI
import UIKit

@main
struct Assignment35App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CategoriesViewControllerRepresentable()
            }
        }
    }
}

struct CategoriesViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CategoriesViewController {
        return CategoriesViewController()
    }
    
    func updateUIViewController(_ uiViewController: CategoriesViewController, context: Context) {
    }
}
