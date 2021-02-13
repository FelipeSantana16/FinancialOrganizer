//
//  CoreDataManager.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 11/02/21.
//

import Foundation
import CoreData

class CoreDataManager {
    // MARK: - Core Data stack

     lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Financial_Organizer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - New Expense ManagedObject
    func newExpenseManagedObject() -> NSManagedObject {
        
        let managedContext = self.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Expense",
                                       in: managedContext)!
        
        return NSManagedObject(entity: entity, insertInto: managedContext)
    }
    
    // MARK: - Fetch Expenses
    func fetchExpenses() -> [Expense] {
        
        do {
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            
            return try self.persistentContainer.viewContext.fetch(request)
            
        } catch {
            print("Não foi possível fazer a requisição dos gastos")
            return []
        
        }
}
    
    // MARK: - Fetch Incomes
    func fetchIncomes() -> [Income] {
        
        do {
            let request = Income.fetchRequest() as NSFetchRequest<Income>
            
            return try self.persistentContainer.viewContext.fetch(request)
            
        } catch {
            print("Não foi possível fazer a requisição das receitas")
            return []
        
        }
    }
    
    // MARK: - Add Expense
    func addExpense(expense: Expense) {
        
        self.persistentContainer.viewContext.insert(expense)
        self.saveContext()
        
    }
    
    // MARK: - Add Income
    func addIncome(income: Income) {
        
        self.persistentContainer.viewContext.insert(income)
        self.saveContext()
        
    }
    
    // MARK: - Remove Expense
    func removeExpense(expense: Expense) {
        
        self.persistentContainer.viewContext.delete(expense)
        self.saveContext()
        
    }
    
    // MARK: - Remove Income
    func removeIncome(income: Income) {
        
        self.persistentContainer.viewContext.delete(income)
        self.saveContext()
        
    }
}
