
import UIKit

class OrderListPresenter: OrderListPresenterProtocol {
    
    weak var view: OrderListViewProtocol?
    var interactor: OrderListInteractorInputProtocol?
    var router: OrderListRouterProtocol?
    
    func showOrderDetail(_ order: OrderItem) {
        guard let view = view else { return }
        router?.presentOrderDetailScreen(from: view, for: order)
    }
    
    func addOrder(_ order: OrderItem) {
        interactor?.saveOrder(order)
    }
    
    func viewWillAppear() {
        interactor?.retrieveOrders()
    }
    
    func removeOrder(_ order: OrderItem) {
        interactor?.deleteOrder(order)
    }
    
}

extension OrderListPresenter: OrderListInteractorOutputProtocol {
    
    func didAddOrder(_ order: OrderItem) {
        interactor?.retrieveOrders()
    }
    
    func didRetrieveOrders(_ orders: [OrderItem]) {
        view?.showOrders(orders)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    func didRemoveOrder(_ order: OrderItem) {
        interactor?.retrieveOrders()
    }
}
