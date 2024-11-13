//
//  DIPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში PaymentProcessor პროტოკოლი საშუალებას აძლევს კლასებს დამოკიდებული იყვნენ აბსტრაქციაზე და შეინარჩუნონ მოქნილობა ყველა ტიპის გადახდის მეოდის გამოყენებისას, რაც შესაბამისობაში მოდის DI პრინციპთან.

protocol PaymentProcessor {
    func processPayment(amount: Double)
}

private final class CreditCardProcessor: PaymentProcessor {
    func processPayment(amount: Double) {
        print("Processing credit card payment of \(amount)")
    }
}

final class PayPalProcessor: PaymentProcessor {
    func processPayment(amount: Double) {
        print("Processing PayPal payment of \(amount)")
    }
}

private final class SalesService {
    let paymentProcessor: PaymentProcessor
    
    init(paymentProcessor: PaymentProcessor) {
        self.paymentProcessor = paymentProcessor
    }
    
    func completeSale(amount: Double) {
        paymentProcessor.processPayment(amount: amount)
    }
}
