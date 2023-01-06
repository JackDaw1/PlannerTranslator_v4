//
//  CustomerDetailRouter.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//

import UIKit

class CustomerDetailRouter: CustomerDetailRouterProtocol {
    
    func navigateBackToListViewController(from view: CustomerDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    static func createCustomerDetailRouterModule(with customer: CustomerItem) -> UIViewController {
        
        let customerDetailVC = CustomerDetailViewController()
        let presenter: CustomerDetailPresenterProtocol & CustomerDetailInteractorOutputProtocol = CustomerDetailPresenter()
        customerDetailVC.presenter = presenter
        presenter.view = customerDetailVC
        let interactor: CustomerDetailInteractorInputProtocol = CustomerDetailInteractor()
        interactor.customerItem = customer
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: CustomerDetailRouterProtocol = CustomerDetailRouter()
        presenter.router = router
        
        return customerDetailVC
    }

    
}


