//
//  OCPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: შემდგომ მაგალითში მოცემულია Discount პროტოკოლი, გააჩნია ფუნქციონალი applyDiscount, რომელიც უზრუნველყოფს ფასდაკლების დამატების განზოგადებას, რასაც კარგად ვხედავთ მომდევნო კლასებში იმპლემენტაციის დროს: PercentageDiscount-იყენებს Discount პროტოკოლს იმისთვის რომ გამოითვალოს კონკრეტული რაოდენობის  ფასდაკლება, FixedDiscount იყენებს ფიქსირებული ფასდაკლებისთვის, ხოლო DiscountCalculator ითვლის კონკრეტული თანხის რაოდენობაზე ფასდაკლების მნიშვნელობას. ყობელივე ზემოხსენებული შესაბამისობაში მოდის OC პრინციპთან.

protocol Discount {
    func applyDiscount(to amount: Double) -> Double
}

final class PercentageDiscount: Discount {
    func applyDiscount(to amount: Double) -> Double {
        return amount * 0.10
    }
}

final class FixedDiscount: Discount {
    func applyDiscount(to amount: Double) -> Double {
        return amount - 10.0
    }
}

private final class DiscountCalculator {
    func calculateDiscount(amount: Double, discount: Discount) -> Double {
        return discount.applyDiscount(to: amount)
    }
}
