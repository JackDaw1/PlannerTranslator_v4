//
//  Order.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 05.01.2023.
//

import Foundation

struct OrderItem: Codable {
    var link: String?
    var deadline: String?
    var made: Bool = false
    var paid: Bool?
    var name: String = ""
    var price: Double?
    var numberOfSigns: Int64?
    var customer: String?
    var time: Int64? //!!
    
    enum OrderKeys: CodingKey {
        case link, deadline, made, paid, name, price
    }
    
    init(link: String?,
        deadline: String?,
        made: Bool = false,
        paid: Bool?,
        name: String = "",
        price: Double?,
        numberOfSigns: Int64?,
        customer:String?,
        time: Int64? = nil) {
        self.deadline = deadline
        self.made = made
        self.paid = paid
        self.name = name
        self.price = price
        self.numberOfSigns = numberOfSigns
        self.customer = customer
        self.time = time
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OrderKeys.self)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.deadline = try container.decodeIfPresent(String.self, forKey: .deadline)
        self.made = try container.decodeIfPresent(Bool.self, forKey: .made) ?? false
        self.paid = try container.decodeIfPresent(Bool.self, forKey: .paid) ?? false
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
    }
}
