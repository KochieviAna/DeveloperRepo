//
//  LSPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: იმისთვის რომ შენარჩუნებულიყო ქცევის კონსისტენცია, შემოტანილ იქნა Order პროტოკოლი რომელსაც აკონფოტმებს როგორც StandardOrder, ასევე BulkOrder კლასი. შენარჩუნებულია ანალოგიური ფროფერთიები და ფუნქციონალები, განსხვავებულია გამოყენების მიდგომები. შესაბამისად მოცემული მაგალითი შესაბამისობაში მოდის LS პრინციპთან.

protocol Order {
    var items: [String] { get }
    var total: Double { get }
    
    func addItem(item: String, price: Double)
}

final class StandardOrder: Order {
    private(set) var items: [String] = []
    private(set) var total: Double = 0.0
    
    func addItem(item: String, price: Double) {
        items.append(item)
        total += price
    }
}

private final class BulkOrder: Order {
    private(set) var items: [String] = []
    private(set) var total: Double = 0.0
    
    func addItem(item: String, price: Double) {
        if items.count >= 10 {
            items.append(item)
            total += price
        } else {
            print("Bulk orders require a minimum of 10 items.")
        }
    }
}
