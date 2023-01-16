//
//  Order.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 05.01.2023.
//

import Foundation

struct SectionOrdersItem {
    var orders: [OrderItem] = []
    var date: Date
}

struct OrderItem: ATProtocol {
    var idAT: String?
    var link: String?
    var deadline: String?
    var made: Bool = false
    var paid: Bool?
    var name: String = ""
    var price: Double?
    var numberOfSigns: Int64?
    var customer: String?
    var time: Int64? //!!
    
    init(
        idAT: String? = nil,
        link: String?,
        deadline: String?,
        made: Bool = false,
        paid: Bool?,
        name: String = "",
        price: Double?,
        numberOfSigns: Int64?,
        customer:String?,
        time: Int64? = nil) {
            self.idAT = idAT
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
        self.customer = try container.decodeIfPresent(String.self, forKey: .customer) ?? ""
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
    }
    
    enum OrderKeys: CodingKey {
        case idAT
        case link
        case deadline
        case made
        case paid
        case name
        case price
        case numberOfSigns
        case customer
        case time
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OrderKeys.self)
        try container.encodeIfPresent(self.link, forKey: .link)
        try container.encodeIfPresent(self.deadline, forKey: .deadline)
        try container.encode(self.made, forKey: .made)
        try container.encodeIfPresent(self.paid, forKey: .paid)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.price, forKey: .price)
        try container.encodeIfPresent(self.numberOfSigns, forKey: .numberOfSigns)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.time, forKey: .time)
    }
    
    public init(order: Order) {
        self.link = order.link
        self.deadline = order.deadline?.toString()
        self.made = order.made
        self.paid = order.paid
        self.name = order.name ?? ""
        self.price = order.price
    }
}
