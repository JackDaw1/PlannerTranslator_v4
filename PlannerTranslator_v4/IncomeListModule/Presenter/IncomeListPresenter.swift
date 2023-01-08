////
////  IncomeListPresenter.swift
////  PlannerTranslator_v4
////
////  Created by Galina Iaroshenko on 07.01.2023.
////
//
//import Foundation
//
//class IncomeListPresenter: IncomeListPresenterProtocol {
//    
//    weak var view: IncomeListViewProtocol?
//    var interactor: IncomeListInteractorInputProtocol?
//    var router: IncomeListRouterProtocol?
//    
//    func showIncomeDetail(_ income: IncomeItem) {
//        guard let view = view else { return }
//        router?.presentIncomeDetailScreen(from: view, for: income)
//    }
//    
//    func addIncome(_ income: IncomeItem) {
//        interactor?.saveIncome(income)
//    }
//    
//    func viewWillAppear() {
//        interactor?.retrieveIncomes()
//    }
//    
//}
//
//extension IncomeListPresenter: IncomeListInteractorOutputProtocol {
//    
//    func didAddIncome(_ income: IncomeItem) {
//        interactor?.retrieveIncomes()
//    }
//    
//    func didRetrieveIncomes(_ incomes: [IncomeItem]) {
//        guard !incomes.isEmpty else { return }
//        
//        let array = incomes.sorted { income1, income2 in
//            guard let deadline1 = income1.deadline, let deadline2 = income2.deadline else {
//                return false
//            }
//            return deadline1 < deadline2
//        }
//        
//        var sectionsResult = [SectionIncomesItem]()
//        var currentDate = incomes.first?.deadline ?? Date()
//        var sectionItem: SectionIncomesItem = SectionIncomesItem(date: currentDate)
//        for income in array {
//            if let deadline = income.deadline, abs(deadline.timeIntervalSince(currentDate)) > 24*60*59 {
//                sectionsResult.append(sectionItem)
//                currentDate = income.deadline ?? Date()
//                sectionItem = SectionIncomesItem(date: currentDate)
//                sectionItem.incomes.append(income)
//            } else {
//                sectionItem.incomes.append(income)
//            }
//        }
//        sectionsResult.append(sectionItem)
//        view?.showIncomes(sectionsResult)
//    }
//    
//    func onError(message: String) {
//        view?.showErrorMessage(message)
//    }
//    
//    func didRemoveIncome(_ income: IncomeItem) {
//        interactor?.retrieveIncomes()
//    }
//}
//
