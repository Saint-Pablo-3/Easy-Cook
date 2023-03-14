import UIKit

class SearchFoodViewController: UIViewController, RecipeCategoryCollectionViewDelegate, CategoryCollectionViewDelegate {
  
    func pickCategoty(pickedCategory: String) {
        if isEnabled{
            isEnabled = false
            recipeCategoryCollectionView.clear()
            searchString =  ""
            searchBar.text = ""
            offset  = 0
            request = .category(cat: pickedCategory, number: loadNum, offset: offset)
            manager.fetchRecipe(query: request!)
            
        }
    }
    
    
    func loadMore() {
        if isEnabled{
            isEnabled = false
            offset += loadNum
            request?.addOffset(off: loadNum)
            manager.fetchRecipe(query: request!)
        }
    }
    
    
    var manager = RequestListRecipesManager()
    var reciepts: [ResultModel] = []
    var loadNum = 20
    var offset = 0
    var searchActive: Bool = false
    var searchString: String = ""
    var categories: [String] = ["Japanese","Italian","European","French","Korean","German"]
    var isEnabled = true
    var request: TypeQueryRecipes?
    
    private var recipeCategoryCollectionView = RecipeCategoryCollectionView()
    private var categoryCollectionView = CategoryCollectionView()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        search.translatesAutoresizingMaskIntoConstraints = false
        search.returnKeyType = .go
        return search
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore more"
        label.font = .poppinsBold40()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .textAccent
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        recipeCategoryCollectionView.actionDelegate = self
        categoryCollectionView.pickDelegate = self
        categoryCollectionView.set(cells: categories)
    }
    
    func cellTapAction(id: Int) {
        present(RecipeViewController(id), animated: true, completion: nil)
    }
    
}

extension SearchFoodViewController {
    func setupView() {
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        view.addSubview(searchBar)
        view.addSubview(recipeCategoryCollectionView)
        view.addSubview(categoryCollectionView)
        searchBar.delegate = self
        manager.delegate = self
        
    }
}

extension SearchFoodViewController: RequestListRecipeDelegate {
  
    func didUpdateRecipeList(_ requestListRecipeManager: RequestListRecipesManager, recipeList: RecipeListModel) {
        DispatchQueue.main.async {
            self.recipeCategoryCollectionView.add(cells: recipeList.results)
        }
        isEnabled = true
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UITextFieldDelegate
extension SearchFoodViewController: UISearchBarDelegate{
    
   
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        recipeCategoryCollectionView.clear()
        searchString = searchBar.text!.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        offset  = 0
        request = .search(query: searchString, number: loadNum, offset: offset)
        manager.fetchRecipe(query: request!)
        searchActive = false
    }

}

// MARK: - setupConstraints()
extension SearchFoodViewController {
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
        ])
        
        NSLayoutConstraint.activate([
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 19),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 68)
        ])
        

        NSLayoutConstraint.activate([
            recipeCategoryCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipeCategoryCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            recipeCategoryCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 19),
            recipeCategoryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
