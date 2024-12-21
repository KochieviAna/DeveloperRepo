//
//  HoldViewModel.swift
//  Assignment33
//
//  Created by MacBook on 18.12.24.
//

import SwiftUI

class HoldViewModel: ObservableObject {
    @Published var showOutlineOnly = false
    @Published var selectedSection: Int? = nil
    
    let sections: [(String, Color)] = [
        ("Ana", Color.red),
        ("Nino", Color.green),
        ("Nika", Color.blue),
        ("Vaso", Color.orange),
        ("Gio", Color.purple),
        ("Sandro", Color.yellow)
    ]
    
    func selectSection(index: Int) {
        selectedSection = index
    }
    
    func toggleOutlineOnly(_ value: Bool) {
        showOutlineOnly = value
    }
}
