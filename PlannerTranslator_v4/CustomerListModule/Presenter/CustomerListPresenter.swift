//
//  CustomerListPresenter.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//
import Foundation

class CustomerListPresenter: CustomerListPresenterProtocol {
    
    weak var view: CustomerListViewProtocol?
    var interactor: CustomerListInteractorInputProtocol?
    var router: CustomerListRouterProtocol?
    
    func showCustomerDetail(_ customer: CustomerItem) {
        guard let view = view else { return }
        router?.presentCustomerDetailScreen(from: view, for: customer)
    }
    
    func addCustomer(_ customer: CustomerItem) {
        interactor?.saveCustomer(customer)
    }
    
    func viewWillAppear() {
        interactor?.retrieveCustomers()
    }
    
    func removeCustomer(_ customer: CustomerItem) {
        interactor?.deleteCustomer(customer)
    }
    
}

extension CustomerListPresenter: CustomerListInteractorOutputProtocol {
    
    func didAddCustomer(_ customer: CustomerItem) {
        interactor?.retrieveCustomers()
    }
    
    func didRetrieveCustomers(_ customers: [CustomerItem]) {
        view?.showCustomers(customers)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    func didRemoveCustomer(_ customer: CustomerItem) {
        interactor?.retrieveCustomers()
    }
}
