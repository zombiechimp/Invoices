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

        NavigationView{
            VStack {
                
                NavigationView {
                    List(invoiceCellData)  {
                        inv in
                        NavigationLink(destination: InvoiceInformation(invoiceInformation: inv)){

                        InvoiceCell(invoice: inv)
                        }
                    }.listStyle(GroupedListStyle())
                }.navigationBarTitle(Text("All Invoices"))
                
                VStack(alignment: .center){
                    Button(action: {}) {
                        Text("New invoice")
                        .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                        
                    }
            }
        }.navigationBarTitle(Text("All Invoices"), displayMode: .inline)
                .navigationBarItems(trailing:Button(action: {}) {Text("...").padding(.horizontal).background(Color.blue).foregroundColor(Color.white)}.mask(Circle())
            )
        
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
