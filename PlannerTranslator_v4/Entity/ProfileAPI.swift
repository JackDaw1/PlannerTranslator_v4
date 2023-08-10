import Foundation

class ProfileAPI {
    
    private init() {}
    public static let shared = ProfileAPI()
    
    public private(set) var profile: ProfileItem =
        ProfileItem(name: "Ярошенко Галина Александровна", contact1: "@gaalya", contact2: "iaroshenko.ga@gmail.com")
}
