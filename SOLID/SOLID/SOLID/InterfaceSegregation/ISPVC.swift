//
//  ISPVC.swift
//  SOLID
//
//  Created by MacBook on 13.11.24.
//

import Foundation

// MARK: მოცემულ მაგალითში შემუშავებულია ორი პროტოკოლი: SalesTask და Reporting, რაც ქვემოთ მოცემულ კლასებს საშუალებას აძლევს საჭიროებისამებრ დააკონფორმონ შესაბამისი პროტოკოლი/ები. ეს შემთხვევა შესაბამისობაში მოდის IS პრინციპთან.

protocol SalesTask {
    func makeSale()
}

protocol Reporting {
    func generateMonthlyReport()
}

private final class PartTimeRepresentative: SalesTask {
    func makeSale() {
        print("Making a sale.")
    }
}

final class FullTimeRepresentative: SalesTask, Reporting {
    func makeSale() {
        print("Making a sale.")
    }
    
    func generateMonthlyReport() {
        print("Generating monthly report.")
    }
}
