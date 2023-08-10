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

        return RFC3339DateFormatter.date(from: value)
    }
    
}
