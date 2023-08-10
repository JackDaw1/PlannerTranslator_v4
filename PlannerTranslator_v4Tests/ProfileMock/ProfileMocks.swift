import UIKit

final class ProfileDetailPresenterMock: ProfileDetailPresenterProtocol {
    var view: ProfileDetailViewProtocol?
    
    var interactor: ProfileDetailInteractorInputProtocol?
    
    var router: ProfileDetailRouterProtocol?
    
    var profileItem: ProfileItem?
    
    func viewDidLoad() {
        
    }
    
    func editProfile(name: String?, contact1: String?, contact2: String?) {
        profileItem?.name = name
        profileItem?.contact1 = contact1
        profileItem?.contact2 = contact2
    }
}

extension ProfileDetailPresenterMock: ProfileDetailInteractorOutputProtocol {
    func didEditProfile(_ profile: ProfileItem) {
        self.profileItem = profile
    }
}

final class ProfileDetailViewMock: ProfileDetailViewProtocol {
    func showProfile(_ profile: ProfileItem) {
        presenter?.viewDidLoad()
    }
    
    var presenter: ProfileDetailPresenterProtocol?
}

final class ProfileDetailInteractorMock: ProfileDetailInteractorInputProtocol {
    var profileItem: ProfileItem?
    
    func editProfile(name: String?, contact1: String?, contact2: String?) {
        profileItem?.name = name
        profileItem?.contact1 = contact1
        profileItem?.contact2 = contact2
    }
    
    var presenter: ProfileDetailInteractorOutputProtocol?
    
    func retrieveOrders() {
        presenter?.didEditProfile(ProfileAPI.shared.profile)
    }
}

final class ProfileDetailRouterMock: ProfileDetailRouterProtocol {
    static func createProfileDetailRouterModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateBackToListViewController(from view: ProfileDetailViewProtocol) {
        
    }
}

