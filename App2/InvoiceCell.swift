//
//  InvoiceCell.swift
//  App2
//
//  Created by Tea Jakić on 16/09/2019.
//  Copyright © 2019 Tea Jakić. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct InvoiceCell : View {
    
    var invoice: InvoicesWithStatus
    
    
    var body: some View {
        return VStack{
            Text( String(invoice.count) + " " + invoice.status.rawValue)
                .font(.footnote)
            Text("$" + String(invoice.total))
                .font(.title).foregroundColor(invoice.status.textColor)
        }
    }
}
