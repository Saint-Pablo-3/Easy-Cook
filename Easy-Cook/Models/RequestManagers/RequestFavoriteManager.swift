import Foundation

// MARK: - RequestFavoriteManager
struct RequestFavoriteManager{
    var delegate: RequestFavoriteManagerDelegate?
    let apiKey = StringConstants.api_Key
    
    let arrayId = UserDefaults.standard.array(forKey: StringConstants.idFavorite)
    
    func formatIdToString() -> String {
        if let arrayId = UserDefaults.standard.array(forKey: StringConstants.idFavorite) as? [Int] {
            let IdString = arrayId.map { String($0) }.joined(separator: ",")
            print("https://api.spoonacular.com/recipes/informationBulk?apiKey\(apiKey)&ids=\(IdString)")
            return IdString
        }
        return "Error"
    }
    
    func getURL()->String{
        
        return "https://api.spoonacular.com/recipes/informationBulk?apiKey=\(apiKey)&ids=\(formatIdToString())"
    }
    
    func fetchRecipe() {
        performRequest(with: getURL())
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
                        print(recipe)
                        self.delegate?.didUpdateRecipe(self, recipe: recipe)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ recipeData: Data) -> [RecipeModel]?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([RecipeData].self, from: recipeData)
            
            var result: [RecipeModel] = []
            
            decodedData.forEach{
                result.append(RecipeModel( data: $0))
            }
            
            return result
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
