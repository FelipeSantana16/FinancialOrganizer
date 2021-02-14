//
//  Parsers.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 13/02/21.
//

import Foundation

//Transform the data from the view to the CoreData Type
struct IncomeDTO {
    var value: String
    var source: String
    var alredyReceived: Bool
    var date: Date
    var fixIncome: Bool
    
    init() {
        self.value = ""
        self.source = ""
        self.date = Date()
        self.alredyReceived = true
        self.fixIncome = true
    }
    
}

//Transform the data from the view to the CoreData Type
struct ExpenseDTO {
    var price: String
    var name: String
    var date: Date
    var local: String
    var paid: Bool
    var paidMethod: String
    var fixExpese: Bool
    
    init() {
        self.price = ""
        self.name = ""
        self.date = Date()
        self.local = ""
        self.paid = true
        self.paidMethod = ""
        self.fixExpese = false
    }
    
}

//Transform the data from the CoreData to the TableView Type
struct CellDTO {
    var itemName: String
    var itemPrice: String
    var itemDate: String
    var itemStatus: Bool
    var date: Date
    var expenseType: Bool
    
    init() {
        itemName = ""
        itemPrice = ""
        itemDate = ""
        itemStatus = true
        date = Date()
        expenseType = true
    }
}
