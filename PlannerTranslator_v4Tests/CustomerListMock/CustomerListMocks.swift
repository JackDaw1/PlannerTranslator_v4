import UIKit

final class CustomerListPresenterMock: CustomerListPresenterProtocol {
    var view: CustomerListViewProtocol?
    
    var interactor: CustomerListInteractorInputProtocol?
    
    var router: CustomerListRouterProtocol?
    
    var customers: [CustomerItem] = [CustomerItem]()
    func viewWillAppear() {
        
    }
    
    func showCustomerDetail(_ customer: CustomerItem) {
        
    }
    
    func addCustomer(_ customer: CustomerItem) {
        customers.append(customer)
    }
    
    func removeCustomer(_ customer: CustomerItem) {
        customers.removeAll(where: { $0.name == customer.name })
    }
}

extension CustomerListPresenterMock: CustomerListInteractorOutputProtocol {
    func didAddCustomer(_ customer: CustomerItem) {
        
    }
    
    func didRemoveCustomer(_ customer: CustomerItem) {
        
    }
    
    func didRetrieveCustomers(_ customers: [CustomerItem]) {
        
    }
    
    func onError(message: String) {
        
    }
    
    
}

final class CustomerListViewMock: CustomerListViewProtocol {
    func showCustomers(_ customers: [CustomerItem]) {
    }
    
    var presenter: CustomerListPresenterProtocol?
    
    func showCustomers(_ sections: [SectionCustomersItem]) {
        presenter?.viewWillAppear()
    }
    
    func showErrorMessage(_ message: String) {
        
    }
}

final class CustomerListInteractorMock: CustomerListInteractorInputProtocol {
    var presenter: CustomerListInteractorOutputProtocol?
    
    func retrieveCustomers() {
        presenter?.didRetrieveCustomers(CustomerAPI.shared.customers)
    }
    
    func saveCustomer(_ customer: CustomerItem) {
        presenter?.didAddCustomer(customer)
    }
    
    func deleteCustomer(_ customer: CustomerItem) {
        presenter?.didRemoveCustomer(customer)
    }
}

final class CustomerListRouterMock: CustomerListRouterProtocol {
    func presentCustomerDetailScreen(from view: CustomerListViewProtocol, for customer: CustomerItem) {
    
    }
    
    func presentCustomerDetailScreen(from view: CustomerListViewProtocol, outputPreneter: CustomerDetailPresenterProtocol, for customer: CustomerItem) {
        
    }
    
    static func createCustomerListModule() -> UIViewController {
        return UIViewController()
    }
}

