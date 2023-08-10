import Foundation

class OrderAPI {
    
    private init() {}
    public static let shared = OrderAPI()
    
    public private(set) var orders: [OrderItem] = [
        OrderItem(link: "https://proglib.io/", deadline: "2023-01-06", made: false, paid: true, name: "SwiftUI updates 06 1 part", price: 1000, numberOfSigns: 10038, customer: "proglib", time: 138),
        OrderItem(link: "https://proglib.io/", deadline:
        "2023-01-06", made: false, paid: true, name: "SwiftUI updates 06 2 part", price: 1000, numberOfSigns: 10038, customer: "proglib", time: 138),
        OrderItem(link: "https://proglib.io/", deadline: "2023-01-07", made: false, paid: true, name: "SwiftUI news 07 1 part", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138),
        OrderItem(link: "https://proglib.io/", deadline: "2023-01-07", made: false, paid: true, name: "SwiftUI news 07 2 part", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138),
        OrderItem(link: "https://proglib.io/", deadline: "2023-01-08", made: true, paid: true, name: "SwiftUI features", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138),
        
    ]
    
    func addOrder(_ order: OrderItem) {
        orders.append(order)
    }
    
    func removeOrder(_ order: OrderItem) {
        if let index = orders.firstIndex(where: { $0.name == order.name }) {
            orders.remove(at: index)
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
