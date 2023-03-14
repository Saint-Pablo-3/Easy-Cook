import UIKit

class LikeButton: UIButton {
    
    static var subscribers = [Int: Set<LikeButton>]()
    static var store = UserDefaultsController()
    static var feeed = [ShowableInCustomCell]()
    static var testDelegate: TestDelegate?
    
    var item: ShowableInCustomCell?
    
    init() {
        super.init(frame: .zero)
        tintColor = .redAccent
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setItem(item: ShowableInCustomCell){
        self.item = item
        if  !LikeButton.subscribers.keys.contains(item.id) {
            LikeButton.subscribers[item.id] = Set<LikeButton>()
        }
        
        LikeButton.subscribers[item.id]!.insert(self)
        self.updateApperance()
    }
    
    func updateApperance() {
        
        if let it = item{
           
            if isLiked {
                
                LikeButton.subscribers[it.id]!.forEach({
                    $0.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                })
            } else {
                
                LikeButton.subscribers[it.id]!.forEach({
                    $0.setImage(UIImage(systemName: "heart"), for: .normal)
                })
            }
        }
    }
    
    
    var isLiked: Bool {
     
        if let it = item{
            return LikeButton.store.getIds().contains(it.id)
        }
        
        return false
    }
    
    @objc func buttonTapped() {
       
        if let it = item{
          
            var ids = LikeButton.store.getIds()
            if isLiked {
                print("remove")
                ids.remove(it.id)
                LikeButton.feeed.removeAll(where: {$0.id == it.id})
                LikeButton.testDelegate?.removeFromFav(item: it)
            } else {
                print("saving")
                ids.insert(it.id)
                LikeButton.feeed.append(it)
                LikeButton.testDelegate?.addToFav(item: it)
            }
            
            LikeButton.store.saveFavoriteId(ids)
            self.updateApperance()
        }
    }
    
    deinit {
        if let it = item{
            LikeButton.subscribers[it.id]!.remove(self)
            
            if LikeButton.subscribers[it.id]!.count == 0{
                LikeButton.subscribers.removeValue(forKey: it.id)
            }
            
        }
    }
}
