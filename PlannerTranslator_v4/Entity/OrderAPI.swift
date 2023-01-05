//var deadline: Date?
//var made: Bool?
//var paid: Bool?
//var name: String
//var price: Double?
//var numberOfSigns: Int?
//var customer: String?
//var time: Int64? //!!
//init(deadline: Date?, made: Bool?, paid: Bool?, name: String, price: Double?, numberOfSigns: Int?, customer:String?, time: Int64?)
import Foundation

class OrderAPI {
    
    private init() {}
    public static let shared = OrderAPI()
    
    public private(set) var orders: [OrderItem] = [
        OrderItem(deadline: OrderAPI.createTestDate(value: "1996-12-19"), made: true, paid: true, name: "SwiftUI updates", price: 1000, numberOfSigns: 10038, customer: "Swiftbook", time: 138),
        
    ]
    
    func addOrder(_ order: OrderItem) {
        orders.append(order)
    }
    
    func removeOrder(_ order: OrderItem) {
        if let index = orders.firstIndex(where: { $0 === order }) {
            orders.remove(at: index)
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
