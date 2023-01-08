////
////  IncomeListInteractor.swift
////  PlannerTranslator_v4
////
////  Created by Galina Iaroshenko on 07.01.2023.
////
//
//
//import Foundation
//
//class IncomeListInteractor: IncomeListInteractorInputProtocol {
//    
//    weak var presenter: IncomeListInteractorOutputProtocol?
//    var incomeStore = IncomeAPI.shared
//    var incomes: [IncomeItem] {
//        return incomeStore.incomes
//    }
//    
//    func retrieveincomes() {
//        //TODO: Add load data from DB
//        //coredata тут прописать загрузку
//        //coreDatdBaseService.loadFrom....->[OrderItem] -> save to orderStore
//        
//        presenter?.didRetrieveincomes(incomes)
//    }
//    
//    func saveIncome(_ income: incomeItem) {
//        //TODO: Add saveing to DB
//        //coredata тут прописать сохранение
//        //coreDatdBaseService.save....
//        incomeStore.addIncome(income) //а это потом удаляем
//        
//        presenter?.didAddIncome(income)
//    }
//    
//    func deleteIncome(_ income: IncomeItem) {
//        incomeStore.removeIncome(income)
//        presenter?.didRemoveIncome(income)
//    }
//    
//}
//
