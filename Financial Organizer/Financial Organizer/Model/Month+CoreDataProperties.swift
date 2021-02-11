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

    @NSManaged public var name: String?
    @NSManaged public var incomes: [Income]?
    @NSManaged public var expenses: [Expense]?
    @NSManaged public var expense: Expense?
    @NSManaged public var income: Income?

}

extension Month : Identifiable {

}
