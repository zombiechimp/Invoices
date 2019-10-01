//
//  InvoiceItems.swift
//  App2
//
//  Created by Tea Jakić on 16/09/2019.
//  Copyright © 2019 Tea Jakić. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
protocol EnumCollection : Hashable {}

// this one -
//typealias InvoicesWithStatus = (status: InvoiceStatus, total: Double, count: Int)
// this one -

typealias StatusInvoices = (status: InvoiceStatus, invoices: [Invoice])
typealias StatusInvoicesList = [StatusInvoices]

enum InvoiceStatus: String, CaseIterable{
    case overdue
    case unpaid
    case notSent = "not sent"
    case total = "Total sales"
    
    var textColor: Color {
      switch self {
      case .overdue:
        return .red
      case .unpaid:
        return .blue
      case .notSent:
        return .gray
        case .total:
          return .green
      }
    }
}

struct InvoicesWithStatus: Identifiable{
    var id = UUID()
    
    var status:InvoiceStatus
    var total:Double
    var count:Int
}

struct Invoice: Identifiable{
    var id = UUID()
    var status: InvoiceStatus
    var charge = 0.0
    
    static func makeStatusInvoicesList(with invoices: [Invoice]) -> StatusInvoicesList {
        var result = StatusInvoicesList()
        
        for status in InvoiceStatus.allCases {
            if status == .total { continue }
            let oneISL = invoices.filter { $0.status == status }
            let oneTouple: StatusInvoices = (status: status, invoices: oneISL)
            result.append(oneTouple)
        }
        return result
    }
    
    static func calcTotal(with invoices: [Invoice]) ->StatusInvoices {
        var result = StatusInvoices(status: .total, invoices: invoices)
        
        return result
    }
    
    static func getInvoiceCellData(with invoices:[Invoice]) ->[InvoicesWithStatus] {
        
        var statusInvoicesList = makeStatusInvoicesList(with: invoices)
        
        statusInvoicesList.append(calcTotal(with: invoices))
        
        var result:[InvoicesWithStatus] = []
        for statusInvoice in statusInvoicesList{
            result.append(InvoicesWithStatus(status:statusInvoice.status, total: statusInvoice.invoices.reduce(0, {$0 + $1.charge}), count: statusInvoice.invoices.count))
        }
        
        
        return result
    }
    
}

let testData: [Invoice] = [
    Invoice(status: .overdue, charge:300.00),
    Invoice(status: .unpaid, charge:45.00),
    Invoice(status: .overdue, charge:30.00),
    Invoice(status: .overdue, charge:750.00),
    Invoice(status: .unpaid, charge:19.99),
    Invoice(status: .unpaid, charge:231.54),
    Invoice(status: .notSent, charge:321.34),
    Invoice(status: .notSent, charge:354.86),
    Invoice(status: .notSent, charge:756.31)
]


