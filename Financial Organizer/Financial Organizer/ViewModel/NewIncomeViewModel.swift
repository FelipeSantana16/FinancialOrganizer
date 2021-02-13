//
//  NewIncomeViewModel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import Foundation

struct IncomeDTO {
    var price: String
    var name: String
    var date: Date
    var local: String
    var paid: Bool
    var paidMethod: String
    var fixExpese: Bool
    var random: String
    
    init() {
        self.price = ""
        self.name = ""
        self.date = Date()
        self.local = ""
        self.paid = true
        self.paidMethod = ""
        self.fixExpese = false
        self.random = ""
    }
    
}

//class NewExpenseViewModel {
//
//    let coreDataManager = CoreDataManager()
//    var expenses = [Expense]()
//
//    func create(expenseDTO: ExpenseDTO) {
//
//        let expenseModel = coreDataManager.newExpenseManagedObject() as! Expense
//
//        expenseModel.price = Double(expenseDTO.price.replacingOccurrences(of: ",", with: ".")) ?? 00.0
//        expenseModel.name = expenseDTO.name
//        expenseModel.date = expenseDTO.date
//        expenseModel.local = expenseDTO.local
//        expenseModel.paid = expenseDTO.paid
//        expenseModel.formOfPayment = expenseDTO.paidMethod
//        expenseModel.isFixed = expenseDTO.fixExpese
//
//        self.expenses.append(expenseModel)
//
//        coreDataManager.saveContext()
//
//    }
//
//    func getAllExpenses() {
//
//        self.expenses = coreDataManager.fetchExpenses()
//
//    }
//
//}
