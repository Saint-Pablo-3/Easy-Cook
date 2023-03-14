import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var pickDelegate: CategoryCollectionViewDelegate?
    
    var cells = [String]()
    func set(cells: [String]) {
        self.cells = cells
    }
    
    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 8
        contentInset = UIEdgeInsets(top: 0, left: CellConstants.leftDestination, bottom: 0, right: CellConstants.rightDestination)
        
        backgroundColor = .backgroundColor
        delegate = self
        dataSource = self
        register(CategoryViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdCategoryVC)
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
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdCategoryVC, for: indexPath) as! CategoryViewCell
        cell.recipeLabel.text = cells[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        pickDelegate?.pickCategoty(pickedCategory: cells[indexPath.row])
    }
}

//MARK: - sizeForItem
extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 166, height: 68)
    }
}
