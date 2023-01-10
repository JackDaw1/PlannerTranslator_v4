//
//  IncomeListRouter.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 07.01.2023.
//

import UIKit

class IncomeListRouter: IncomeListRouterProtocol {
    static func createIncomeListModule() -> UIViewController {
        let incomeListViewController = IncomeListViewController()
        let presenter: IncomeListPresenterProtocol & IncomeListInteractorOutputProtocol = IncomeListPresenter()
        let interactor: IncomeListInteractorInputProtocol = IncomeListInteractor()
        let router = IncomeListRouter()
        
        incomeListViewController.presenter = presenter
        presenter.view = incomeListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return incomeListViewController
    }
}
