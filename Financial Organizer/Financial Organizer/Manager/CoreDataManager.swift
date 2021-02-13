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

    static var persistentContainer: NSPersistentContainer = {
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
        let context = CoreDataManager.persistentContainer.viewContext
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
        
        let managedContext = CoreDataManager.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Expense",
                                       in: managedContext)!
        
        return NSManagedObject(entity: entity, insertInto: managedContext)
    }
    
    // MARK: - Fetch Expenses
    func fetchExpenses() -> [Expense] {
        var expenses = [Expense]()
        
        do {
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            
            try expenses = CoreDataManager.persistentContainer.viewContext.fetch(request)
            
        } catch {
            
            return expenses
        
        }
        
        return expenses
    }
    
    // MARK: - Fetch Incomes
    func fetchIncomes() -> [Income] {
        var incomes = [Income]()
        
        do {
            let request = Income.fetchRequest() as NSFetchRequest<Income>
            
            try incomes = CoreDataManager.persistentContainer.viewContext.fetch(request)
            
        } catch {
            
            return incomes
        
        }
        
        return incomes
    }
}
