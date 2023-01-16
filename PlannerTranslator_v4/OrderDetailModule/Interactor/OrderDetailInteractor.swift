import Foundation

class OrderDetailInteractor: OrderDetailInteractorInputProtocol {
    
    weak var presenter: OrderDetailInteractorOutputProtocol?
    var orderStore = OrderAPI.shared
    var orderItem: OrderItem?
    
    func deleteOrder() {
        guard let orderItem = orderItem else { return }
        orderStore.removeOrder(orderItem)
        presenter?.didDeleteOrder()
    }
    
    func editOrder(link: String?, deadline: Date?, made: Bool?, paid: Bool?, name: String?, price: Double?, numberOfSigns: Int64?, customer: String?, time: Int64?) {
        guard let orderItem = orderItem else { return }
        var newOrder = orderItem
        if let name = name {
            newOrder.name = name
        }
        if let made = made {
            newOrder.made = made
        }
        OrdersModel.edit(newOrder) { [weak self] item in
            self?.presenter?.didEditOrder(newOrder)
        } errorHandler: { error in
        }
    }
    
}
