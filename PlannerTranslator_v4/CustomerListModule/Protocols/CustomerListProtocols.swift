import UIKit

protocol CustomerListViewProtocol: class {
    
    var presenter: CustomerListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCustomers(_ customers: [CustomerItem])
    func showErrorMessage(_ message: String)
}

protocol CustomerListPresenterProtocol: class {
    
    var view: CustomerListViewProtocol? { get set }
    var interactor: CustomerListInteractorInputProtocol? { get set }
    var router: CustomerListRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewWillAppear()
    func showCustomerDetail(_ customer: CustomerItem)
    func addCustomer(_ customer: CustomerItem)
    func removeCustomer(_ customer: CustomerItem)
}

protocol CustomerListInteractorInputProtocol: class {
    
    var presenter: CustomerListInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveCustomers()
    func saveCustomer(_ customer: CustomerItem)
    func deleteCustomer(_ customer: CustomerItem)
}

protocol CustomerListInteractorOutputProtocol: class {
    
    // INTERACTOR -> PRESENTER
    func didAddCustomer(_ customer: CustomerItem)
    func didRemoveCustomer(_ customer: CustomerItem)
    func didRetrieveCustomers(_ customers: [CustomerItem])
    func onError(message: String)
}

protocol CustomerListRouterProtocol: class {
    
    static func createCustomerListModule() -> UIViewController
    
    // PRESENTER -> ROUTER
    func presentCustomerDetailScreen(from view: CustomerListViewProtocol, for customer: CustomerItem)
}

