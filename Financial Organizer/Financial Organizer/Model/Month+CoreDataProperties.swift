//
//  Month+CoreDataProperties.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 11/02/21.
//
//

import Foundation
import CoreData


extension Month {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Month> {
        return NSFetchRequest<Month>(entityName: "Month")
    }

    @NSManaged public var expenses: [Expense]?
    @NSManaged public var incomes: [Income]?
    @NSManaged public var name: String?
    @NSManaged public var expense: NSSet?
    @NSManaged public var income: NSSet?

}

// MARK: Generated accessors for expense
extension Month {

    @objc(addExpenseObject:)
    @NSManaged public func addToExpense(_ value: Expense)

    @objc(removeExpenseObject:)
    @NSManaged public func removeFromExpense(_ value: Expense)

    @objc(addExpense:)
    @NSManaged public func addToExpense(_ values: NSSet)

    @objc(removeExpense:)
    @NSManaged public func removeFromExpense(_ values: NSSet)

}

// MARK: Generated accessors for income
extension Month {

    @objc(addIncomeObject:)
    @NSManaged public func addToIncome(_ value: Income)

    @objc(removeIncomeObject:)
    @NSManaged public func removeFromIncome(_ value: Income)

    @objc(addIncome:)
    @NSManaged public func addToIncome(_ values: NSSet)

    @objc(removeIncome:)
    @NSManaged public func removeFromIncome(_ values: NSSet)

}

extension Month : Identifiable {

}
