//
//  ProfileDetailRouter.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 07.01.2023.
//

import UIKit

class ProfileDetailRouter: ProfileDetailRouterProtocol {
    
    func navigateBackToListViewController(from view: ProfileDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    static func createProfileDetailRouterModule(with profile: ProfileItem) -> UIViewController {
        
        let profileDetailVC = ProfileDetailViewController()
        let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
        profileDetailVC.presenter = presenter
        presenter.view = profileDetailVC
        let interactor: ProfileDetailInteractorInputProtocol = ProfileDetailInteractor()
        interactor.profileItem = profile
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: ProfileDetailRouterProtocol = ProfileDetailRouter()
        presenter.router = router
        
        return profileDetailVC
    }

    
    static func createProfileListModule() -> UIViewController {
        let profileDetailViewController = ProfileDetailViewController()
        let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
        let interactor: ProfileDetailInteractorInputProtocol = ProfileDetailInteractor()
        let router = ProfileDetailRouter()
        
        profileDetailViewController.presenter = presenter
        presenter.view = profileDetailViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return profileDetailViewController
    }

    
}


