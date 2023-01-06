//
//  ProfileDetailProtocols.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//

//var name: String
//var info: String?
//var contact1: String?
//var contact2: String?

import UIKit

protocol CustomerDetailViewProtocol: class {
    
    var presenter: CustomerDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showCustomer(_ customer: CustomerItem)
}

protocol CustomerDetailPresenterProtocol: class {
    
    var view: CustomerDetailViewProtocol? { get set }
    var interactor: CustomerDetailInteractorInputProtocol? { get set }
    var router: CustomerDetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    //!!!!!!!!!!!!!!!!!!!!
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?)
    func deleteCustomer()
}

protocol CustomerDetailInteractorInputProtocol: class {
    
    var presenter: CustomerDetailInteractorOutputProtocol? { get set }
    var customerItem: CustomerItem? { get set }
    
    // PRESENTER -> INTERACTOR
    func deleteCustomer()
    //!!!!!!!!!!!!!!!!!!!
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?)
}

protocol CustomerDetailInteractorOutputProtocol: class {
    
    // INTERACTOR -> PRESENTER
    func didDeleteCustomer()
    func didEditCustomer(_ customer: CustomerItem)
}

protocol CustomerDetailRouterProtocol: class {
    
    static func createCustomerDetailRouterModule(with customer: CustomerItem) -> UIViewController
    
    // PRESENTER -> ROUTER
    func navigateBackToListViewController(from view: CustomerDetailViewProtocol)
    
}
