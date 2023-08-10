//
//  Order+CoreDataProperties.swift
//  
//
//  Created by Galina Iaroshenko on 09.01.2023.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var deadline: Date?
    @NSManaged public var link: String?
    @NSManaged public var made: Bool
    @NSManaged public var name: String?
    @NSManaged public var numberOfSigns: Int64
    @NSManaged public var paid: Bool
    @NSManaged public var price: Double
    @NSManaged public var time: Int64
    @NSManaged public var customer: Customer?

}
