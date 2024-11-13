//
//  NotOCPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: DiscountCalculator კლასი მოიცავს ფუნქციას რომელიც უზრუნველყოფს ფასდაკების ორი ტიპის განსაზღვრას (percentage და fixed), შესაბამისად იძლევა შეზღუდულ შესაძლებლობას დამატებითი ტიპის განსაზღვრის შემთხვევაში, სწორედ ამიტომ DiscountCalculator კლასი ეწინაღმდეგება OC პრინციპს.

private final class DiscountCalculator {
    func calculateDiscount(amount: Double, discountType: String) -> Double {
        if discountType == "percentage" {
            return amount * 0.10
        } else if discountType == "fixed" {
            return amount - 10.0
        } else {
            return amount
        }
    }
}
