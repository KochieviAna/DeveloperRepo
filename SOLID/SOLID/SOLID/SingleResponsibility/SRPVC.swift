//
//  SRPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში ცალ-ცალკე არის გამოყოფილი SalesOrder-ს კლასი, რომელიც პასუხისმგებელია პროდუქტის დამატებაზე და EmailService კლასი რომელიც აგზავნის დადასტურების მეილს. შესაბამისად თითოეული კლასის ფუნქციონალთა რაოდენობა არის ერთის ტოლი და ემსახურება ერთ კონკრეტულ საქმეს, რაც აკმაყოფილებს SR პრინციპს.

private final class SalesOrder {
    var items: [String] = []
    var total: Double = 0.0

    func addItem(item: String, price: Double) {
        items.append(item)
        total += price
    }
}

private final class EmailService {
    func sendConfirmationEmail(for order: SalesOrder) {
        print("Sending confirmation email for items: \(order.items) with total: \(order.total)")
    }
}
