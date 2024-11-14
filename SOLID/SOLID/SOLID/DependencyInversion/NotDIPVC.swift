//
//  NotDIPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში SalesService კლასი არის დამოკიდებულლი CreditCardProcessor კლასზე რაც არღვევს DI პრინციპს მჭიდრო დამოკიდებულების შექმნით.

private final class CreditCardProcessor {
    func processPayment(amount: Double) {
        print("Processing credit card payment of \(amount)")
    }
}

private final class SalesService {
    let paymentProcessor = CreditCardProcessor()
    
    func completeSale(amount: Double) {
        paymentProcessor.processPayment(amount: amount)
    }
}
