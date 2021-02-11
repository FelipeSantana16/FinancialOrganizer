//
//  Expense+CoreDataProperties.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 11/02/21.
//
//

import Foundation
import CoreData

extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var date: Date?
    @NSManaged public var formOfPayment: Int64
    @NSManaged public var isFixed: Bool
    @NSManaged public var local: String?
    @NSManaged public var name: String?
    @NSManaged public var paid: Bool
    @NSManaged public var price: Double
    @NSManaged public var month: Month?

}

extension Expense: Identifiable {

}
