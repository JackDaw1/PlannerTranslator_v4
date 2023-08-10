import UIKit

protocol IncomeListViewProtocol: AnyObject {
    
    var presenter: IncomeListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showIncomes(_ sections: [SectionIncomesItem])
    func showErrorMessage(_ message: String)
}

protocol IncomeListPresenterProtocol: AnyObject {
    
    var view: IncomeListViewProtocol? { get set }
    var interactor: IncomeListInteractorInputProtocol? { get set }
    var router: IncomeListRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewWillAppear()
}

protocol IncomeListInteractorInputProtocol: AnyObject {
    
    var presenter: IncomeListInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveIncomes()
}

protocol IncomeListInteractorOutputProtocol: AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didRetrieveIncomes(_ incomes: [OrderItem])
    func onError(message: String)
}

protocol IncomeListRouterProtocol: AnyObject {
    
    static func createIncomeListModule() -> UIViewController
}
