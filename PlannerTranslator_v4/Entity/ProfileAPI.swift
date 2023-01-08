import Foundation

class ProfileAPI {
    
    private init() {}
    public static let shared = ProfileAPI()
    
    public private(set) var profile: ProfileItem =
        ProfileItem(name: "Ярошенко Галина Александровна", contact1: "@telegram_contact_Miroslav", contact2: "miroslav_email@gmail.com")
}
