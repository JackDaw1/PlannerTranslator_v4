import Foundation

class IncomeListPresenter: IncomeListPresenterProtocol {
    
    weak var view: IncomeListViewProtocol?
    var interactor: IncomeListInteractorInputProtocol?
    var router: IncomeListRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveIncomes()
    }
    
}

extension IncomeListPresenter: IncomeListInteractorOutputProtocol {
    
    func didAddIncome(_ income: OrderItem) {
        interactor?.retrieveIncomes()
    }
    
    func didRetrieveIncomes(_ incomes: [OrderItem]) {
        guard !incomes.isEmpty else { return }
        
        let array = incomes.filter({ $0.made == true }).sorted { income1, income2 in
            guard let deadline1 = income1.deadline, let deadline2 = income2.deadline else {
                return false
            }
            return deadline1 < deadline2
        }
        
        var sectionsResult = [SectionIncomesItem]()
        var currentDate = incomes.first?.deadline?.toDate() ?? Date()
        var sectionItem: SectionIncomesItem = SectionIncomesItem(date: currentDate)
        for income in array {
            if let deadline = income.deadline?.toDate(), abs(deadline.timeIntervalSince(currentDate)) > 24*60*59 {
                sectionsResult.append(sectionItem)
                currentDate = income.deadline?.toDate() ?? Date()
                sectionItem = SectionIncomesItem(date: currentDate)
                sectionItem.incomes.append(income)
            } else {
                sectionItem.incomes.append(income)
            }
        }
        sectionsResult.append(sectionItem)
        view?.showIncomes(sectionsResult)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    func didRemoveIncome(_ income: OrderItem) {
        interactor?.retrieveIncomes()
    }
}

