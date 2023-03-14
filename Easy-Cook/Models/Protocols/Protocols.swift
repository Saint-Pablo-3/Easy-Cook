

import Foundation


protocol ShowableInCustomCell{
    var id: Int { get }
    var image: String { get }
    var title: String { get }
}

protocol RecipeCategoryCollectionViewDelegate{
    func cellTapAction(id: Int)
    func loadMore()
}

protocol CategoryCollectionViewDelegate{
    func pickCategoty(pickedCategory: String)
}

protocol RequestListRecipeDelegate{
    func didUpdateRecipeList(_ requestListRecipeManager: RequestListRecipesManager, recipeList: RecipeListModel)
    func didFailWithError(error: Error)
}

// MARK: - RequestManagerDelegate
protocol RequestManagerDelegate{
    func didUpdateRecipe(_ requestManager: RequestManager, recipe: RecipeModel)
    func didFailWithError(error: Error)
}

// MARK: - RequestFavoriteManagerDelegate
protocol RequestFavoriteManagerDelegate{
    func didUpdateRecipe(_ requestManager: RequestFavoriteManager, recipe: [RecipeModel])
    func didFailWithError(error: Error)
}
