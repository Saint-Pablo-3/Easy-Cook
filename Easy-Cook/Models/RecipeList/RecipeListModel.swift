import UIKit

// MARK: - RecipeListModel
struct RecipeListModel {
    var results: [ResultModel]
    let offset, number, totalResults: Int
}

// MARK: RecipeListModel convenience initializers
extension RecipeListModel{
    init(data: Recipes) {
        self.results = []
        
        self.offset = data.offset
        self.number = data.number
        self.totalResults = data.totalResults
        data.results.forEach{
            self.results.append(ResultModel(data: $0))
        }
    }
}

// MARK: - ResultModel
struct ResultModel: ShowableInCustomCell {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

// MARK: ResultModel convenience initializers
extension ResultModel{
    init(data: Result) {
        self.id = data.id
        self.title = data.title
        self.image = data.image.replacingOccurrences(of: "http:", with: "https:")
                            .replacingOccurrences(of: "312x231", with: "480x360") // TODO
        
        self.imageType = data.imageType
    }
}
