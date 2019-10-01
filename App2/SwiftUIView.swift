//
//  SwiftUIView.swift
//  App2
//
//  Created by Tea Jakić on 01/10/2019.
//  Copyright © 2019 Tea Jakić. All rights reserved.
//

import SwiftUI


struct NotificationsUIView: View {
    @State private var customerViewedInvoice = true
    @State private var customerPayment = true
    @State private var overdueInvoices = true
    var body: some View {
        NavigationView{
            
            VStack{
                
            

            Form {
                Section {
                    Toggle(isOn: $customerViewedInvoice) {
                        Text("Customer viewed invoice")
                    }
                    Toggle(isOn: $customerPayment) {
                        Text("Customer payment")}
                    Toggle(isOn: $overdueInvoices) {
                        Text("Overdue invoices")}
                }
                
                
            }
            
            }.navigationBarTitle(Text("Notifications"), displayMode: .inline)
            .navigationBarItems(trailing:Button(action: {}) {Text("Done").foregroundColor(Color.purple)})
        }
    }
}

    


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsUIView()
    }
}
