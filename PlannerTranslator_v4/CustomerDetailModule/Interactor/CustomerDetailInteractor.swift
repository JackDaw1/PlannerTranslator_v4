//
//  CustomerDetailInteractor.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 06.01.2023.
//

import Foundation

class CustomerDetailInteractor: CustomerDetailInteractorInputProtocol {
    
    weak var presenter: CustomerDetailInteractorOutputProtocol?
    var customerStore = CustomerAPI.shared
    var customerItem: CustomerItem?
    
    func deleteCustomer() {
        guard let customerItem = customerItem else { return }
        customerStore.removeCustomer(customerItem)
        presenter?.didDeleteCustomer()
    }
    
    func editCustomer(name: String, info: String?, contact1: String?, contact2: String?) {
        guard let customerItem = customerItem else { return }
        customerItem.name = name
        presenter?.didEditCustomer(customerItem)
    }
    
}
