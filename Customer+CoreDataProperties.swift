//
//  Customer+CoreDataProperties.swift
//  
//
//  Created by Galina Iaroshenko on 09.01.2023.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var contact1: String?
    @NSManaged public var contact2: String?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var orders: Order?

}
