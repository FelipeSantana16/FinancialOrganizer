//
//  NewIncomeViewModel.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//

import Foundation
import CoreData

class IncomeViewModel {

    let coreDataManager = CoreDataManager()
    var incomes = [Income]()

    func createIncomeDataModel(incomeDTO: IncomeDTO) {

        let incomeModel = coreDataManager.newIncomeManagedObject() as! Income

        incomeModel.value = Double(incomeDTO.value.replacingOccurrences(of: ",", with: ".")) ?? 00.0
        incomeModel.source = incomeDTO.source
        incomeModel.date = incomeDTO.date
        incomeModel.alredyReceived = incomeDTO.alredyReceived
        incomeModel.isFixed = incomeDTO.fixIncome
        
        self.incomes.append(incomeModel)

        coreDataManager.saveContext()

    }
    
    func getIncomesForCell() -> [CellDTO] {
        
        self.incomes = coreDataManager.fetchIncomes()
        
        var cellIncomes = [CellDTO]()
        
        for income in incomes {
            
            var cell = CellDTO()
            cell.itemName = income.source ?? "Sem nome"
            cell.itemPrice = "R$ " + String(income.value)
            
            let format = DateFormatter()
            format.locale = Locale(identifier: "pt_BR")
            format.setLocalizedDateFormatFromTemplate("MMMd")
            let formattedDate = format.string(from: income.date ?? Date()).capitalized
            
            cell.itemDate = formattedDate.replacingOccurrences(of: " De", with: "")
            
            cell.itemStatus = income.alredyReceived
            
            cell.date = income.date ?? Date()
            
            cell.expenseType = false
            
            cellIncomes.append(cell)
        }
        
        return cellIncomes
        
    }

    func getAllIncomes() {

        self.incomes = coreDataManager.fetchIncomes()

    }
    
    func getTotalIncome() -> Double {
        
        getAllIncomes()
        
        var total = 0.0
        
        for income in incomes {
            
            total += income.value
            
        }
        
        return total
    }

}
