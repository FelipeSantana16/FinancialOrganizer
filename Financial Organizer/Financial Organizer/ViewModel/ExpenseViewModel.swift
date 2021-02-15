//
//  NewExpenseViewModel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import Foundation
import CoreData

class ExpenseViewModel {
    
    let coreDataManager = CoreDataManager()
    var expenses = [Expense]()

    func createExpenseDataModel(expenseDTO: ExpenseDTO) {
        
        let expenseModel = coreDataManager.newExpenseManagedObject() as! Expense
        
        expenseModel.price = Double(expenseDTO.price.replacingOccurrences(of: ",", with: ".")) ?? 00.0
        expenseModel.name = expenseDTO.name
        expenseModel.date = expenseDTO.date
        expenseModel.local = expenseDTO.local
        expenseModel.paid = expenseDTO.paid
        expenseModel.formOfPayment = expenseDTO.paidMethod
        expenseModel.isFixed = expenseDTO.fixExpese
        
        self.expenses.append(expenseModel)
        
        coreDataManager.saveContext()
        
    }
    
    func getExpensesForCell() -> [CellDTO] {
        
        self.expenses = coreDataManager.fetchExpenses()
        
        var cellExpenses = [CellDTO]()
        
        for expense in expenses {
            
            var cell = CellDTO()
            cell.itemName = expense.name ?? "Sem nome"
            cell.itemPrice = "R$ -" + String(expense.price)
            
            let format = DateFormatter()
            format.locale = Locale(identifier: "pt_BR")
            format.setLocalizedDateFormatFromTemplate("MMMd")
            let formattedDate = format.string(from: expense.date ?? Date()).capitalized
            
            cell.itemDate = formattedDate.replacingOccurrences(of: " De", with: "")
            
            cell.itemStatus = expense.paid
            
            cell.date = expense.date ?? Date()
            
            cell.expenseType = true
            
            cellExpenses.append(cell)
        }
        
        cellExpenses.sort {
            
            $0.date > $1.date
            
        }
        
        return cellExpenses
        
    }
    
    func getAllExpenses() {
        
        self.expenses = coreDataManager.fetchExpenses()
    
    }
    
    func getTotalExpense() -> Double {
        
        getAllExpenses()
        
        var total = 0.0
        
        for expense in expenses {
            
            total += expense.price
            
        }
        
        return total
    }
    
}
