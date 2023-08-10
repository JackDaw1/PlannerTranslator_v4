//
//  ProfileDetailPresenter.swift
//  PlannerTranslator_v4
//
//  Created by Galina Iaroshenko on 07.01.2023.
//

import Foundation

class ProfileDetailPresenter: ProfileDetailPresenterProtocol {
    
    weak var view: ProfileDetailViewProtocol?
    var router: ProfileDetailRouterProtocol?
    var interactor: ProfileDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let profileItem = interactor?.profileItem {
            view?.showProfile(profileItem)
        }
    }
    
    func editProfile(name: String?, contact1:String?, contact2: String?) {
        
        interactor?.editProfile(name: name, contact1: contact1, contact2: contact2)
    }
}

extension ProfileDetailPresenter: ProfileDetailInteractorOutputProtocol {
    
    
    //    func didDeleteOrder() {
    //        if let view = view {
    //            router?.navigateBackToListViewController(from: view)
    //        }
    //    }
    
    func didEditProfile(_ profile: ProfileItem) {
        view?.showProfile(profile)
    }
    
}

