import UIKit

class FavoriteListViewController: BaseFeedViewController, TestDelegate{
   
    func removeFromFav(item: ShowableInCustomCell) {
        reciepts.removeAll(where: { $0.id == item.id})
        self.tableView.reloadData()
    }
    

    func addToFav(item: ShowableInCustomCell) {
        reciepts.append(item)
        self.tableView.reloadData()
    }
    
    
    var manager = RequestFavoriteManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        manager.delegate = self
        LikeButton.testDelegate = self
        
        manager.fetchRecipe()
        configureTableView()
        tableView.register(TableViewTopCustomHeader.self, forHeaderFooterViewReuseIdentifier: StringConstants.sectiontHeaderIndent)
    }

   
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    // init custom tableView header
     func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: StringConstants.sectiontHeaderIndent) as! TableViewTopCustomHeader
       view.title.text = "Liked recipes"
       return view
    }
}

// MARK: - Extension (RequestListRecipeDelegate)
extension FavoriteListViewController: RequestFavoriteManagerDelegate{

    func didUpdateRecipe(_ requestManager: RequestFavoriteManager, recipe: [RecipeModel]) {
        DispatchQueue.main.async {
            
            recipe.forEach({
                self.reciepts.append($0)
            })
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
