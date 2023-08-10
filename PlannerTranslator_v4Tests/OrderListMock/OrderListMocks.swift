import UIKit

final class OrderListPresenterMock: OrderListPresenterProtocol {
    var view: OrderListViewProtocol?
    
    var interactor: OrderListInteractorInputProtocol?
    
    var router: OrderListRouterProtocol?
    
    var orders: [OrderItem] = [OrderItem]()
    func viewWillAppear() {
        
    }
    
    func showOrderDetail(_ order: OrderItem) {
        
    }
    
    func addOrder(_ order: OrderItem) {
        orders.append(order)
    }
    
    func removeOrder(_ order: OrderItem) {
        orders.removeAll(where: { $0.name == order.name })
    }
}

extension OrderListPresenterMock: OrderListInteractorOutputProtocol {
    func didAddOrder(_ order: OrderItem) {
        
    }
    
    func didRemoveOrder(_ order: OrderItem) {
        
    }
    
    func didRetrieveOrders(_ orders: [OrderItem]) {
        
    }
    
    func onError(message: String) {
        
    }
    
    
}

final class OrderListViewMock: OrderListViewProtocol {
    var presenter: OrderListPresenterProtocol?
    
    func showOrders(_ sections: [SectionOrdersItem]) {
        presenter?.viewWillAppear()
    }
    
    func showErrorMessage(_ message: String) {
        
    }
}

final class OrderListInteractorMock: OrderListInteractorInputProtocol {
    var presenter: OrderListInteractorOutputProtocol?
    
    func retrieveOrders() {
        presenter?.didRetrieveOrders(OrderAPI.shared.orders)
    }
    
    func saveOrder(_ order: OrderItem) {
        presenter?.didAddOrder(order)
    }
    
    func deleteOrder(_ order: OrderItem) {
        presenter?.didRemoveOrder(order)
    }
}

final class OrderListRouterMock: OrderListRouterProtocol {
    func presentOrderDetailScreen(from view: OrderListViewProtocol, outputPreneter: OrderDetailPresenterOutputProtocol, for order: OrderItem) {
        
    }
    
    static func createOrderListModule() -> UIViewController {
        return UIViewController()
    }
}

