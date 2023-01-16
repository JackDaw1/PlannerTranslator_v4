import Foundation

class CustomerDetailPresenter: CustomerDetailPresenterProtocol {

    weak var view: CustomerDetailViewProtocol?
    var router: CustomerDetailRouterProtocol?
    var interactor: CustomerDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let customerItem = interactor?.customerItem {
            view?.showCustomer(customerItem)
        }
    }
    
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?) {
        interactor?.editCustomer(name: name ?? "", info: info, contact1: contact1, contact2: contact2)
    }
    
    func deleteCustomer() {
        interactor?.deleteCustomer()
    }
    
}
extension CustomerDetailPresenter: CustomerDetailInteractorOutputProtocol {
    
    func didDeleteCustomer() {
        if let view = view {
            router?.navigateBackToListViewController(from: view)
        }
    }
    
    func didEditCustomer(_ customer: CustomerItem) {
        view?.showCustomer(customer)
    }
    
}
