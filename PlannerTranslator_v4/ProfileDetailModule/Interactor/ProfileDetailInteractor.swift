import Foundation

class ProfileDetailInteractor: ProfileDetailInteractorInputProtocol {

    weak var presenter: ProfileDetailInteractorOutputProtocol?
    var profileStore = ProfileAPI.shared
    var profileItem: ProfileItem?

    func editProfile(name: String?, contact1: String?, contact2: String?) {
        guard let profileItem = profileItem else { return }
        profileItem.name = name!
        presenter?.didEditProfile(profileItem)
    }
}
