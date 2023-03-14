import Foundation

struct CellConstants {
    static let leftDestination: CGFloat = 12
    static let rightDestination: CGFloat = 12
}

protocol TestDelegate{
    func addToFav(item: ShowableInCustomCell)
    func removeFromFav(item: ShowableInCustomCell)
}
