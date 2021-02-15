//
//  MainPanelViewModel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 13/02/21.
//

import Foundation

class MainPanelViewModel {
    
    var expensesViewModel = ExpenseViewModel()
    var incomesViewModel = IncomeViewModel()
    var entries = [CellDTO]()
    
    func updateEntries() {
        
        let expenses = expensesViewModel.getExpensesForCell()
        let incomes = incomesViewModel.getIncomesForCell()
        
        entries = []
        
        entries.append(contentsOf: expenses)
        entries.append(contentsOf: incomes)
        
        entries.sort {
            $0.date > $1.date
        }
        
    }
    
    func getBalance() -> Double {
                
        return  incomesViewModel.getTotalIncome() - expensesViewModel.getTotalExpense()
        
    }
    
}
