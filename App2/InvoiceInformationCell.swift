//
//  InvoiceInformationCell.swift
//  App2
//
//  Created by Tea Jakić on 10/10/2019.
//  Copyright © 2019 Tea Jakić. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct InvoiceInformationCell:View{
    
    var invoice:Invoice
    
    var body: some View{
        return VStack{
//            Text(String(invoice.id)).font(.title).foregroundColor(invoice.status.textColor)
        Text(String(invoice.charge)).foregroundColor(invoice.status.textColor)
//            Text("placeholder")
        }

    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
