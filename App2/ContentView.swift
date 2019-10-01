//
//  ContentView.swift
//  Swuitea
//
//  Created by Mihaela Mihaljevic Jakic on 23/09/2019.
//  Copyright © 2019 Mihaela Mihaljevic Jakic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let invoices: [Invoice] = testData

    let invoiceCellData = Invoice.getInvoiceCellData(with: testData)
    var body: some View {

        VStack {
            VStack(alignment: .leading){
                Text("All Invoices").font(.largeTitle)
            }
            
            NavigationView {
                List(invoiceCellData) { inv in
                    InvoiceCell(invoice: inv)
                }
            }.navigationBarTitle(Text("All Invoices"))
            
            VStack(alignment: .center){
                Button(action: {}) {
                    Text("New invoice")
                    .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
