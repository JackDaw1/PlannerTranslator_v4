
import Foundation

class OrderListPresenter: OrderListPresenterProtocol {
    
    weak var view: OrderListViewProtocol?
    var interactor: OrderListInteractorInputProtocol?
    var router: OrderListRouterProtocol?
    
    func showOrderDetail(_ order: OrderItem) {
        guard let view = view else { return }
        router?.presentOrderDetailScreen(from: view,
                                         outputPreneter: self,
                                         for: order)
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
    func didRemoveOrder(_ order: OrderItem) {
        interactor?.retrieveOrders()
    }
    
    
    func didAddOrder(_ order: OrderItem) {
        interactor?.retrieveOrders()
    }
    
    func didRetrieveOrders(_ orders: [OrderItem]) {
        guard !orders.isEmpty else { return }
        
        let array = orders
            .filter({ $0.made != true })
            .sorted { order1, order2 in
                guard let deadline1 = order1.deadline?.toDate(), let deadline2 = order2.deadline?.toDate() else {
                return false
            }
            return deadline1 < deadline2
        }
        
        var sectionsResult = [SectionOrdersItem]()
        let deadline = orders.first?.deadline?.toDate()
        var currentDate = deadline ?? Date()
        var sectionItem: SectionOrdersItem = SectionOrdersItem(date: currentDate)
        for order in array {
            if let deadline = order.deadline?.toDate(), abs(deadline.timeIntervalSince(currentDate)) > 24*60*59 {
                sectionsResult.append(sectionItem)
                currentDate = order.deadline?.toDate() ?? Date()
                sectionItem = SectionOrdersItem(date: currentDate)
                sectionItem.orders.append(order)
            } else {
                sectionItem.orders.append(order)
            }
        }
        sectionsResult.append(sectionItem)
        view?.showOrders(sectionsResult)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
}

extension OrderListPresenter: OrderDetailPresenterOutputProtocol {
    func didDeleteOrder(_ order: OrderItem) {
        //это обработка завершения редактирования заказа и закрытия экрана деталей заказа
        //тут глушим полную перезагрузку экрана потому что она уже есть в viewWillAppear в презентере экрана OrdersListViewController
//        interactor?.retrieveOrders()
    }
    
    func didEditOrder(_ order: OrderItem) {
        //тут глушим полную перезагрузку экрана потому что она уже есть в viewWillAppear в презентере экрана OrdersListViewController
//        interactor?.retrieveOrders()
    }
    
}
