//
//  CustomerAPI.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 05.01.2023.
//

//var name: String
//var info: String?
//var contact1: String?
//var contact2: String?

import Foundation

class CustomerAPI {
    
    private init() {}
    public static let shared = CustomerAPI()
    
    public private(set) var customers: [CustomerItem] = [
        CustomerItem(name: "GazpromBank", info: "Отдел iOS разработки", contact1: "@gazprombank", contact2: "gazprombank@gazprombank.com"),
        CustomerItem(name: "proglib", info: "Miroslav Kungurov", contact1: "@telegramproglib", contact2: "proglib@gmail.com"),
        CustomerItem(name: "swiftbook", info: "Ivan Akulov", contact1: "@telegramswiftbook", contact2: "swiftbook@gmail.com"),
        
    ]
    
    func addCustomer(_ customer: CustomerItem) {
        customers.append(customer)
    }
    
    func removeCustomer(_ customer: CustomerItem) {
        if let index = customers.firstIndex(where: { $0 === customer }) {
            customers.remove(at: index)
        }
    }
    
    static func createTestDate(value: String) -> Date? {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        //let string = "1996-12-19T16:39:57-08:00"
        return RFC3339DateFormatter.date(from: value)
    }
    
}
