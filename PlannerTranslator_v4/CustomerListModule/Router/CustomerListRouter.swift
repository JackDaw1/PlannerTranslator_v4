import UIKit

class CustomerListRouter: CustomerListRouterProtocol {
      
    
    static func createCustomerListModule() -> UIViewController {
        let customerListViewController = CustomerListViewController()
        let presenter: CustomerListPresenterProtocol & CustomerListInteractorOutputProtocol = CustomerListPresenter()
        let interactor: CustomerListInteractorInputProtocol = CustomerListInteractor()
        let router = CustomerListRouter()
        
        customerListViewController.presenter = presenter
        presenter.view = customerListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return customerListViewController
    }
    
    func presentCustomerDetailScreen(from view: CustomerListViewProtocol, for customer: CustomerItem) {
        let customerDetailVC = CustomerDetailRouter.createCustomerDetailRouterModule(with: customer)
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.navigationController?.pushViewController(customerDetailVC, animated: true)
    }
    
    

    
}
