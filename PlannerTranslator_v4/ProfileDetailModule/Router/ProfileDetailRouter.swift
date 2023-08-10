import UIKit

class ProfileDetailRouter: ProfileDetailRouterProtocol {
    
    func navigateBackToListViewController(from view: ProfileDetailViewProtocol) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        viewVC.navigationController?.popViewController(animated: true)
    }
    
    static func createProfileDetailRouterModule() -> UIViewController {
        
        let profileDetailVC = ProfileDetailViewController()
        let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
        profileDetailVC.presenter = presenter
        presenter.view = profileDetailVC
        let interactor: ProfileDetailInteractorInputProtocol = ProfileDetailInteractor()
        interactor.profileItem = ProfileAPI.shared.profile
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: ProfileDetailRouterProtocol = ProfileDetailRouter()
        presenter.router = router
        
        return profileDetailVC
    }
    
}


