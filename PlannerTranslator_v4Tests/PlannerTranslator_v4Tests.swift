import XCTest

@testable import PlannerTranslator_v4

final class PlannerTranslator_v4Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOrderList() throws {
        let presenter = OrderListPresenterMock()
        let view = OrderListViewMock()
        view.presenter = presenter
        let router = OrderListRouterMock()
        let interactor = OrderListInteractorMock()
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        XCTAssertTrue(presenter.orders.isEmpty, "No orders")
        
        let newElement = OrderItem(link: "https://proglib.io/", deadline: "2023-01-08", made: false, paid: true, name: "SwiftUI features", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138)
        presenter.addOrder(newElement)
        
        XCTAssertFalse(presenter.orders.isEmpty, "Order is added")
        
        presenter.removeOrder(newElement)
        XCTAssertTrue(presenter.orders.isEmpty, "Order is removed")
        
    }
    
    func testCustomerList() throws {
        let presenter = CustomerListPresenterMock()
        let view = CustomerListViewMock()
        view.presenter = presenter
        let router = CustomerListRouterMock()
        let interactor = CustomerListInteractorMock()
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        XCTAssertTrue(presenter.customers.isEmpty, "No orders")
        
//        let newElementCustomer = CustomerItem(link: "https://proglib.io/", deadline: "2023-01-08", made: false, paid: true, name: "SwiftUI features", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138)
//        presenter.addCustomer(newElementCustomer)
//        
//        XCTAssertFalse(presenter.cusomers.isEmpty, "Customer is added")
//        
//        presenter.removeCusomer(newElementCustomer)
//        XCTAssertTrue(presenter.cusomers.isEmpty, "Customer is removed")
        
        interactor.retrieveCustomers()
        XCTAssertTrue(presenter.customers.isEmpty, "Customers are loaded")
    }
    
    
    func testProfile() throws {
        let presenter = ProfileDetailPresenterMock()
        let view = ProfileDetailViewMock()
        view.presenter = presenter
        let router = ProfileDetailRouterMock()
        let interactor = ProfileDetailInteractorMock()
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        XCTAssertTrue(presenter.profileItem == nil, "Profile not inited")
        
        interactor.retrieveOrders()
        XCTAssertTrue(presenter.profileItem != nil, "Profile is loaded")
        
        presenter.editProfile(
            name: "TEST",
            contact1: "TestContact1",
            contact2: "TestContact2"
        )
        XCTAssertTrue(presenter.profileItem?.name == "TEST", "Profile changed")
    }
    
//    func testDBInited() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        let context = PTDataBaseService.shared.persistentContainer.viewContext
//        let request = Order.fetchRequest()
//        let ordersDB0 = try? context.fetch(request)
//
//        XCTAssertTrue(ordersDB0 != nil, "DB inited")
//    }
    
//    func testDBCommon() throws {
//        let context = PTDataBaseService.shared.persistentContainer.viewContext
//        let request = Order.fetchRequest()
//        let ordersDB0 = try? context.fetch(request)
//
//        XCTAssertTrue(ordersDB0 != nil, "DB inited")
//
//        let oldCount = ordersDB0?.count ?? 0
//
//        let newElement = OrderItem(link: "https://proglib.io/", deadline: "2023-01-08", made: false, paid: true, name: "SwiftUI features", price: 1000, numberOfSigns: 10038, customer: "swiftbook", time: 138)
//
//        let newOrder = Order(context: context)
//        newOrder.name = newElement.name
//        newOrder.link = newElement.link
//        newOrder.deadline = newElement.deadline?.toDate()
//        newOrder.made = newElement.made
//        newOrder.price = newElement.price ?? 0.0
//        newOrder.customer = nil
//        newOrder.paid = newElement.paid ?? false
//        newOrder.numberOfSigns = newElement.numberOfSigns ?? 0
//        newOrder.time = newElement.time ?? 0
//
//            do {
//                try context.save()
//            } catch {
//                context.rollback()
//            }
//        let newCount = ordersDB0?.count ?? 0
//
//        XCTAssertTrue(newCount > oldCount, "DB is edited")//
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
