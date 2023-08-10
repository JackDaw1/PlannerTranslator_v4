import Foundation

class CustomerListInteractor: CustomerListInteractorInputProtocol {
    
    weak var presenter: CustomerListInteractorOutputProtocol?
    var customerStore = CustomerAPI.shared
    var customers: [CustomerItem] {
        return customerStore.customers
    }
    
    func retrieveCustomers() {
        //TODO: Add load data from DB
        //coredata тут прописать загрузку
        //coreDatdBaseService.loadFrom....->[OrderItem] -> save to orderStore
        
        presenter?.didRetrieveCustomers(customers)
    }
    
    func saveCustomer(_ customer: CustomerItem) {
        //TODO: Add saveing to DB
        //coredata тут прописать сохранение
        //coreDatdBaseService.save....
        customerStore.addCustomer(customer) //а это потом удаляем
        
        presenter?.didAddCustomer(customer)
    }
    
    func deleteCustomer(_ customer: CustomerItem) {
        customerStore.removeCustomer(customer)
        presenter?.didRemoveCustomer(customer)
    }
    
}
