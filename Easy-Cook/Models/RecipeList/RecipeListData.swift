import Foundation

// MARK: - Recipes
struct Recipes: Codable {
    let results: [Result]
    let offset, number, totalResults: Int
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}

