import Foundation

enum TypeQueryRecipes {
    case list(number: Int, offset: Int)
    case search(query: String, number: Int, offset: Int)
    case category(cat: String, number: Int, offset: Int)
    
    mutating func addOffset(off: Int) {
        switch self{
            
        case let .list(number,offset):
            self = .list(number: number,offset: offset + off)
            
        case let .search(query,number,offset):
            self = .search(query: query,number: number,offset: offset + off)
            
        case let .category(cat,number,offset):
            self = .category(cat: cat,number: number,offset: offset + off)
        }
    }
}

struct RequestListRecipesManager{
    var delegate: RequestListRecipeDelegate?
    
    let apiKey = StringConstants.api_Key
    
    func getURL(typeQuery: TypeQueryRecipes)->String{
        switch typeQuery {
        case .list(let number, let offset):
            return       "https://api.spoonacular.com/recipes/complexSearch?number=\(number)&sort=popularity&sortDirection=desc&offset=\(offset)&apiKey=\(apiKey)"
        case .search(let query, let number, let offset):
            return "https://api.spoonacular.com/recipes/complexSearch?sort=popularity&sortDirection=desc&number=\(number)&offset=\(offset)&apiKey=\(apiKey)&query=\(query)"
        case .category(let cat, let number, let offset):
            return "https://api.spoonacular.com/recipes/complexSearch?sort=popularity&sortDirection=desc&number=\(number)&offset=\(offset)&apiKey=\(apiKey)&cuisine=\(cat)"
        }
    }
    
    func fetchRecipe(query: TypeQueryRecipes) {
        performRequest(with: getURL(typeQuery: query))
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let recipe = self.parseJSON(safeData) {
                        
                        self.delegate?.didUpdateRecipeList(self, recipeList: recipe)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ recipeListData: Data) -> RecipeListModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Recipes.self, from: recipeListData)
            
            return RecipeListModel(data: decodedData)
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
