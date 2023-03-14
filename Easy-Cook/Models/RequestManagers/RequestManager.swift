import Foundation

// MARK: - RequestManager
struct RequestManager{
    var delegate: RequestManagerDelegate?
    
    let apiKey = StringConstants.api_Key
    func getURL(recipeId: Int)->String{
        return "https://api.spoonacular.com/recipes/\(recipeId)/information?apiKey=\(apiKey)&includeNutrition=true"
    }
    
    func fetchRecipe(_ recipeId: Int) {
        performRequest(with: getURL(recipeId: recipeId))
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
                        self.delegate?.didUpdateRecipe(self, recipe: recipe)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ recipeData: Data) -> RecipeModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RecipeData.self, from: recipeData)
            
            return RecipeModel(data: decodedData)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
