//
//  Income+CoreDataProperties.swift
//  Financial Organizer
//
//  Created by Felipe Santana on 12/02/21.
//
//

import Foundation
import CoreData

extension Income {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Income> {
        return NSFetchRequest<Income>(entityName: "Income")
    }

    @NSManaged public var alredyReceived: Bool
    @NSManaged public var date: Date?
    @NSManaged public var isFixed: Bool
    @NSManaged public var source: String?
    @NSManaged public var value: Double

}

extension Income: Identifiable {

}
