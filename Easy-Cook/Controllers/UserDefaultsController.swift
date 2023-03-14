import Foundation

class UserDefaultsController{
    
    private let defaults = UserDefaults.standard
    
    func saveFavoriteId(_ ids: Set<Int>) {
        defaults.set(Array(ids), forKey: StringConstants.idFavorite)
    }
    
    func getIds() -> Set<Int> {
        let likedsArray = defaults.object(forKey: StringConstants.idFavorite) as? [Int] ?? []
        return Set(likedsArray)
    }
}
