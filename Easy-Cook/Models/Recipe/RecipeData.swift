import Foundation

// MARK: - RecipeData
struct RecipeData: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: String?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let creditsText, license, sourceName: String?
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String
    let image: String
    let imageType: String
    let nutrition: Nutrition?
    let summary: String
    let cuisines, dishTypes, diets: [String]
    let occasions: [JSONAny]
    let winePairing: WinePairing?
    let instructions: String?
    let analyzedInstructions: [AnalyzedInstruction]
    let originalID: JSONNull?
    let spoonacularSourceURL: String

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, license, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case image, imageType, nutrition, summary, cuisines, dishTypes, diets, occasions, winePairing, instructions, analyzedInstructions
        case originalID = "originalId"
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }
}

// MARK: RecipeData convenience initializers and mutators
extension RecipeData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RecipeData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        vegetarian: Bool? = nil,
        vegan: Bool? = nil,
        glutenFree: Bool? = nil,
        dairyFree: Bool? = nil,
        veryHealthy: Bool? = nil,
        cheap: Bool? = nil,
        veryPopular: Bool? = nil,
        sustainable: Bool? = nil,
        lowFodmap: Bool? = nil,
        weightWatcherSmartPoints: Int? = nil,
        gaps: String? = nil,
        preparationMinutes: Int? = nil,
        cookingMinutes: Int? = nil,
        aggregateLikes: Int? = nil,
        healthScore: Int? = nil,
        creditsText: String? = nil,
        license: String? = nil,
        sourceName: String? = nil,
        pricePerServing: Double? = nil,
        extendedIngredients: [ExtendedIngredient]? = nil,
        id: Int? = nil,
        title: String? = nil,
        readyInMinutes: Int? = nil,
        servings: Int? = nil,
        sourceURL: String? = nil,
        image: String? = nil,
        imageType: String? = nil,
        nutrition: Nutrition? = nil,
        summary: String? = nil,
        cuisines: [String]? = nil,
        dishTypes: [String]? = nil,
        diets: [String]? = nil,
        occasions: [JSONAny]? = nil,
        winePairing: WinePairing? = nil,
        instructions: String? = nil,
        analyzedInstructions: [AnalyzedInstruction]? = nil,
        originalID: JSONNull?? = nil,
        spoonacularSourceURL: String? = nil
    ) -> RecipeData {
        return RecipeData(
            vegetarian: vegetarian ?? self.vegetarian,
            vegan: vegan ?? self.vegan,
            glutenFree: glutenFree ?? self.glutenFree,
            dairyFree: dairyFree ?? self.dairyFree,
            veryHealthy: veryHealthy ?? self.veryHealthy,
            cheap: cheap ?? self.cheap,
            veryPopular: veryPopular ?? self.veryPopular,
            sustainable: sustainable ?? self.sustainable,
            lowFodmap: lowFodmap ?? self.lowFodmap,
            weightWatcherSmartPoints: weightWatcherSmartPoints ?? self.weightWatcherSmartPoints,
            gaps: gaps ?? self.gaps,
            preparationMinutes: preparationMinutes ?? self.preparationMinutes,
            cookingMinutes: cookingMinutes ?? self.cookingMinutes,
            aggregateLikes: aggregateLikes ?? self.aggregateLikes,
            healthScore: healthScore ?? self.healthScore,
            creditsText: creditsText ?? self.creditsText,
            license: license ?? self.license,
            sourceName: sourceName ?? self.sourceName,
            pricePerServing: pricePerServing ?? self.pricePerServing,
            extendedIngredients: extendedIngredients ?? self.extendedIngredients,
            id: id ?? self.id,
            title: title ?? self.title,
            readyInMinutes: readyInMinutes ?? self.readyInMinutes,
            servings: servings ?? self.servings,
            sourceURL: sourceURL ?? self.sourceURL,
            image: image ?? self.image,
            imageType: imageType ?? self.imageType,
            nutrition: nutrition ?? self.nutrition,
            summary: summary ?? self.summary,
            cuisines: cuisines ?? self.cuisines,
            dishTypes: dishTypes ?? self.dishTypes,
            diets: diets ?? self.diets,
            occasions: occasions ?? self.occasions,
            winePairing: winePairing ?? self.winePairing,
            instructions: instructions ?? self.instructions,
            analyzedInstructions: analyzedInstructions ?? self.analyzedInstructions,
            originalID: originalID ?? self.originalID,
            spoonacularSourceURL: spoonacularSourceURL ?? self.spoonacularSourceURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable {
    let name: String
    let steps: [Step]
}

// MARK: AnalyzedInstruction convenience initializers and mutators

extension AnalyzedInstruction {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AnalyzedInstruction.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        steps: [Step]? = nil
    ) -> AnalyzedInstruction {
        return AnalyzedInstruction(
            name: name ?? self.name,
            steps: steps ?? self.steps
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Step
struct Step: Codable {
    let number: Int
    let step: String
    let ingredients, equipment: [Ent]
    let length: Length?
}

// MARK: Step convenience initializers and mutators
extension Step {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Step.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        number: Int? = nil,
        step: String? = nil,
        ingredients: [Ent]? = nil,
        equipment: [Ent]? = nil,
        length: Length?? = nil
    ) -> Step {
        return Step(
            number: number ?? self.number,
            step: step ?? self.step,
            ingredients: ingredients ?? self.ingredients,
            equipment: equipment ?? self.equipment,
            length: length ?? self.length
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Ent
struct Ent: Codable {
    let id: Int
    let name, localizedName, image: String
}

// MARK: Ent convenience initializers and mutators
extension Ent {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ent.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String? = nil,
        localizedName: String? = nil,
        image: String? = nil
    ) -> Ent {
        return Ent(
            id: id ?? self.id,
            name: name ?? self.name,
            localizedName: localizedName ?? self.localizedName,
            image: image ?? self.image
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Length
struct Length: Codable {
    let number: Int
    let unit: String
}

// MARK: Length convenience initializers and mutators
extension Length {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Length.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        number: Int? = nil,
        unit: String? = nil
    ) -> Length {
        return Length(
            number: number ?? self.number,
            unit: unit ?? self.unit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable {
    let id: Int
    let aisle: String?
    let image, consistency, name: String
    let nameClean, original, originalName: String
    let amount: Double
    let unit: String
    let meta: [String]
    let measures: Measures
}

// MARK: ExtendedIngredient convenience initializers and mutators
extension ExtendedIngredient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ExtendedIngredient.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        aisle: String? = nil,
        image: String? = nil,
        consistency: String? = nil,
        name: String? = nil,
        nameClean: String? = nil,
        original: String? = nil,
        originalName: String? = nil,
        amount: Double? = nil,
        unit: String? = nil,
        meta: [String]? = nil,
        measures: Measures? = nil
    ) -> ExtendedIngredient {
        return ExtendedIngredient(
            id: id ?? self.id,
            aisle: aisle ?? self.aisle,
            image: image ?? self.image,
            consistency: consistency ?? self.consistency,
            name: name ?? self.name,
            nameClean: nameClean ?? self.nameClean,
            original: original ?? self.original,
            originalName: originalName ?? self.originalName,
            amount: amount ?? self.amount,
            unit: unit ?? self.unit,
            meta: meta ?? self.meta,
            measures: measures ?? self.measures
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Measures
struct Measures: Codable {
    let us, metric: Metric
}

// MARK: Measures convenience initializers and mutators
extension Measures {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Measures.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        us: Metric? = nil,
        metric: Metric? = nil
    ) -> Measures {
        return Measures(
            us: us ?? self.us,
            metric: metric ?? self.metric
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Metric
struct Metric: Codable {
    let amount: Double
    let unitShort, unitLong: String
}

// MARK: Metric convenience initializers and mutators
extension Metric {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Metric.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        amount: Double? = nil,
        unitShort: String? = nil,
        unitLong: String? = nil
    ) -> Metric {
        return Metric(
            amount: amount ?? self.amount,
            unitShort: unitShort ?? self.unitShort,
            unitLong: unitLong ?? self.unitLong
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Nutrition
struct Nutrition: Codable {
    let nutrients, properties, flavonoids: [Flavonoid]
    let ingredients: [Ingredient]
    let caloricBreakdown: CaloricBreakdown
    let weightPerServing: WeightPerServing
}

// MARK: Nutrition convenience initializers and mutators
extension Nutrition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Nutrition.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        nutrients: [Flavonoid]? = nil,
        properties: [Flavonoid]? = nil,
        flavonoids: [Flavonoid]? = nil,
        ingredients: [Ingredient]? = nil,
        caloricBreakdown: CaloricBreakdown? = nil,
        weightPerServing: WeightPerServing? = nil
    ) -> Nutrition {
        return Nutrition(
            nutrients: nutrients ?? self.nutrients,
            properties: properties ?? self.properties,
            flavonoids: flavonoids ?? self.flavonoids,
            ingredients: ingredients ?? self.ingredients,
            caloricBreakdown: caloricBreakdown ?? self.caloricBreakdown,
            weightPerServing: weightPerServing ?? self.weightPerServing
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CaloricBreakdown
struct CaloricBreakdown: Codable {
    let percentProtein, percentFat, percentCarbs: Double
}

// MARK: CaloricBreakdown convenience initializers and mutators
extension CaloricBreakdown {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CaloricBreakdown.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        percentProtein: Double? = nil,
        percentFat: Double? = nil,
        percentCarbs: Double? = nil
    ) -> CaloricBreakdown {
        return CaloricBreakdown(
            percentProtein: percentProtein ?? self.percentProtein,
            percentFat: percentFat ?? self.percentFat,
            percentCarbs: percentCarbs ?? self.percentCarbs
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Flavonoid
struct Flavonoid: Codable {
    let name: String
    let amount: Double
    let unit: Unit
    let percentOfDailyNeeds: Double?
}

// MARK: Flavonoid convenience initializers and mutators
extension Flavonoid {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Flavonoid.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        amount: Double? = nil,
        unit: Unit? = nil,
        percentOfDailyNeeds: Double?? = nil
    ) -> Flavonoid {
        return Flavonoid(
            name: name ?? self.name,
            amount: amount ?? self.amount,
            unit: unit ?? self.unit,
            percentOfDailyNeeds: percentOfDailyNeeds ?? self.percentOfDailyNeeds
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Unit: String, Codable {
    case empty = ""
    case g = "g"
    case iu = "IU"
    case kcal = "kcal"
    case mg = "mg"
    case unit = "%"
    case µg = "µg"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
    let nutrients: [Flavonoid]
}

// MARK: Ingredient convenience initializers and mutators
extension Ingredient {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ingredient.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String? = nil,
        amount: Double? = nil,
        unit: String? = nil,
        nutrients: [Flavonoid]? = nil
    ) -> Ingredient {
        return Ingredient(
            id: id ?? self.id,
            name: name ?? self.name,
            amount: amount ?? self.amount,
            unit: unit ?? self.unit,
            nutrients: nutrients ?? self.nutrients
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - WeightPerServing
struct WeightPerServing: Codable {
    let amount: Int
    let unit: Unit
}

// MARK: WeightPerServing convenience initializers and mutators
extension WeightPerServing {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeightPerServing.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        amount: Int? = nil,
        unit: Unit? = nil
    ) -> WeightPerServing {
        return WeightPerServing(
            amount: amount ?? self.amount,
            unit: unit ?? self.unit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - WinePairing
struct WinePairing: Codable {
    let pairedWines: [String]?
    let pairingText: String?
    let productMatches: [ProductMatch]?
}

// MARK: WinePairing convenience initializers and mutators
extension WinePairing {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WinePairing.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        pairedWines: [String]? = nil,
        pairingText: String? = nil,
        productMatches: [ProductMatch]? = nil
    ) -> WinePairing {
        return WinePairing(
            pairedWines: pairedWines ?? self.pairedWines,
            pairingText: pairingText ?? self.pairingText,
            productMatches: productMatches ?? self.productMatches
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ProductMatch
struct ProductMatch: Codable {
    let id: Int
    let title, description, price: String
    let imageURL: String
    let averageRating: Double
    let ratingCount: Int
    let score: Double
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case imageURL = "imageUrl"
        case averageRating, ratingCount, score, link
    }
}

// MARK: ProductMatch convenience initializers and mutators
extension ProductMatch {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ProductMatch.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: StringConstants.JSONDecoding, code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        title: String? = nil,
        description: String? = nil,
        price: String? = nil,
        imageURL: String? = nil,
//        averageRating: Int? = nil,
        averageRating: Double? = nil, // new
        ratingCount: Int? = nil,
        score: Double? = nil,
        link: String? = nil
    ) -> ProductMatch {
        return ProductMatch(
            id: id ?? self.id,
            title: title ?? self.title,
            description: description ?? self.description,
            price: price ?? self.price,
            imageURL: imageURL ?? self.imageURL,
            averageRating: averageRating ?? self.averageRating,
            ratingCount: ratingCount ?? self.ratingCount,
            score: score ?? self.score,
            link: link ?? self.link
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers
class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
