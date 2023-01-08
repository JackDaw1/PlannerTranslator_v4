////
////  IncomeListProtocols.swift
////  PlannerTranslator_v4
////
////  Created by Galina Iaroshenko on 07.01.2023.
////
//
//
//import UIKit
//
//protocol IncomeListViewProtocol: class {
//    
//    var presenter: IncomeListPresenterProtocol? { get set }
//    
//    // PRESENTER -> VIEW
//    func showIncomes(_ sections: [SectionIncomesItem])
//    func showErrorMessage(_ message: String)
//}
//
//protocol IncomeListPresenterProtocol: class {
//    
//    var view: IncomeListViewProtocol? { get set }
//    var interactor: IncomeListInteractorInputProtocol? { get set }
//    var router: IncomeListRouterProtocol? { get set }
//    
//    // VIEW -> PRESENTER
//    func viewWillAppear()
//    func showIncomeDetail(_ income: IncomeItem)
//    func addIncome(_ income: IncomeItem)
//    func removeIncome(_ income: IncomeItem)
//}
//
//protocol IncomeListInteractorInputProtocol: class {
//    
//    var presenter: IncomeListInteractorOutputProtocol? { get set }
//    
//    // PRESENTER -> INTERACTOR
//    func retrieveIncomes()
//    func saveIncome(_ income: IncomeItem)
//    func deleteIncome(_ income: IncomeItem)
//}
//
//protocol IncomeListInteractorOutputProtocol: AnyObject {
//    
//    // INTERACTOR -> PRESENTER
//    func didAddIncome(_ income: IncomeItem)
//    func didRemoveIncome(_ income: IncomeItem)
////    func didRetrieveIncomes(_ incomes: [IncomeItem])
//    func onError(message: String)
//}
//
//protocol IncomeListRouterProtocol: AnyObject {
//    
//    static func createIncomeListModule() -> UIViewController
//    
//    // PRESENTER -> ROUTER
//    func presentIncomeDetailScreen(from view: IncomeListViewProtocol, for income: IncomeItem)
//}
