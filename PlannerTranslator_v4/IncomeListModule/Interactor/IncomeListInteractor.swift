import Foundation

class IncomeListInteractor: IncomeListInteractorInputProtocol {
    
    weak var presenter: IncomeListInteractorOutputProtocol?
    var incomeStore = OrderAPI.shared
    var incomes: [OrderItem] {
        return incomeStore.orders
    }
    
    func retrieveIncomes() {
        //TODO: Add load data from DB
        //coredata тут прописать загрузку
        //coreDatdBaseService.loadFrom....->[OrderItem] -> save to orderStore
        
        OrdersModel.loadTasks(completionHandler: { [weak self] orderList in
            guard let self = self else { return }
            
            self.presenter?.didRetrieveIncomes(orderList)
        }, errorHandler: { [weak self] error in
            
        })
    }
}

