//
//  NotISPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში PartTimeRepresentative აკონფირმებს SalesRepresentative, რის გამოც "იძულებულია" მიიღოს მისთვის არარელევანტური ფუნქციონალი generateMonthlyReport, რომელსაც არ იყენებს. შესაბამისად ეს შემთხვევა ეწინააღმდეგება IS პრინციპს.

protocol SalesRepresentative {
    func makeSale()
    func generateMonthlyReport()
}

private final class PartTimeRepresentative: SalesRepresentative {
    func makeSale() {
        print("Making a sale.")
    }
    
    func generateMonthlyReport() { }
}
