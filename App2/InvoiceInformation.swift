//
//  InvoiceInformation.swift
//  App2
//
//  Created by Tea Jakić on 10/10/2019.
//  Copyright © 2019 Tea Jakić. All rights reserved.
//

import SwiftUI

struct InvoiceInformation: View {
    var invoiceInformation : InvoicesWithStatus
    var body: some View {
        NavigationView{
            NavigationView{
                
                List(invoiceInformation.invoices){inv in
                    InvoiceInformationCell(invoice: inv)
                }
            }.navigationBarTitle(Text(invoiceInformation.status.rawValue.capitalizingFirstLetter() + "  invoices").foregroundColor(invoiceInformation.status.textColor), displayMode: .inline)
            
        }
    }
}

struct InvoiceInformation_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceInformation(invoiceInformation: Invoice.getInvoiceCellData(with: testData).randomElement()!)
    }
}
