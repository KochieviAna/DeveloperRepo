//
//  NotLSPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში BulkOrder subClass-ცვლის SalesOrder superClass-ის ქცევას მინიმალური რაოდენობის დამატებით, რის გამოც იგი ეწინააღმდეგება LS პრინციპს.

private class SalesOrder {
    var items: [String] = []
    var total: Double = 0.0
    
    func addItem(item: String, price: Double) {
        items.append(item)
        total += price
    }
}

private class BulkOrder: SalesOrder {
    override func addItem(item: String, price: Double) {
        if items.count < 10 {
            print("Bulk orders require a minimum of 10 items.")
        } else {
            super.addItem(item: item, price: price)
        }
    }
}
