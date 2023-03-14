import UIKit
import Kingfisher

class RecipeCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cells = [ResultModel]()
    var actionDelegate: RecipeCategoryCollectionViewDelegate?
    
    func set(cells: [ResultModel]) {
        self.cells = cells
        self.reloadData()
    }
    
    func add(cells: [ResultModel]) {
        cells.forEach({
            self.cells.append($0)
        })
    
        self.reloadData()
    }
    
    func clear() {
        cells.removeAll()
        self.reloadData()
    }


    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: CellConstants.leftDestination, bottom: 0, right: CellConstants.rightDestination)
        
        backgroundColor = .backgroundColor
        delegate = self
        dataSource = self
        register(RecipeCategoryViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdRecipwCategoryVC)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdRecipwCategoryVC, for: indexPath) as! RecipeCategoryViewCell
        
        cell.mainImage.kf.setImage(with: URL(string: cells[indexPath.row].image))
        cell.recipeLabel.text = cells[indexPath.row].title
        cell.recieptLikeButton.setItem(item:  cells[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionDelegate?.cellTapAction(id: cells[indexPath.row].id)
    }
    
    //Updating amount of shoings cells it TableView
    internal func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row >= cells.count - 3 {
            actionDelegate?.loadMore()
        }
    }
    
}

//MARK: - sizeForItem
extension RecipeCategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.frame.width-100, height: collectionView.frame.height)
    }
}
