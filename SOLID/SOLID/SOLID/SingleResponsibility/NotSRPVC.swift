//
//  NotSRPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: კლასს SalesOrder-ს აქვს როგორც პროდუქტის დამატების ასევე დადასტურების იმეილის გაგზავნის ფუნქცია. მოცემული მაგალითი ეწინააღმდეგება SR პრინციპს, რადგან დატვირტულია ერთზე მეტი ვალდებულებით.

private final class SalesOrder {
    var items: [String] = []
    var total: Double = 0.0
    
    func addItem(item: String, price: Double) {
        items.append(item)
        total += price
    }
    
    func sendConfirmationEmail() {
        print("Sending confirmation email for items: \(items) with total: \(total)")
    }
}
