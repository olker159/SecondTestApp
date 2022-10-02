//
//  RandomRecipeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 16/09/2022.
//

import Foundation

struct RandomRecipe: Codable {
    let recipes: [Recipe]
}

extension RandomRecipe {
    struct Recipe: Codable {
        let vegetarian: Bool
        let vegan: Bool
        let glutenFree: Bool
        let dairyFree: Bool
        let veryHealthy: Bool
        let cheap: Bool
        let veryPopular: Bool
        let sustainable: Bool
        let lowFodmap: Bool
        let weightWatcherSmartPoints: Int
        let gaps: String
        let preparationMinutes: Int
        let cookingMinutes: Int
        let aggregateLikes: Double
        let healthScore: Int
        let creditsText: String
        let sourceName: String
        let pricePerServing: Double
        let extendedIngredients: [ExtendedIngredient]
        let id: Int
        let title: String
        let readyInMinutes: Int
        let servings: Int
        let sourceURL: String
        let image: String
        let imageType: String
        let summary: String
        let dishTypes: [String]
        let diets: [String]
        let instructions: String
        let analyzedInstructions: [AnalyzedInstruction]
        let spoonacularSourceURL: String
        
        private enum CodingKeys: String, CodingKey {
            case vegetarian
            case vegan
            case glutenFree
            case dairyFree
            case veryHealthy
            case cheap
            case veryPopular
            case sustainable
            case lowFodmap
            case weightWatcherSmartPoints
            case gaps
            case preparationMinutes
            case cookingMinutes
            case aggregateLikes
            case healthScore
            case creditsText
            case sourceName
            case pricePerServing
            case extendedIngredients
            case id
            case title
            case readyInMinutes
            case servings
            case sourceURL = "sourceUrl"
            case image
            case imageType
            case summary
            case dishTypes
            case diets
            case instructions
            case analyzedInstructions
            case spoonacularSourceURL = "spoonacularSourceUrl"
        }
    }
}

extension RandomRecipe.Recipe {
    struct ExtendedIngredient: Codable {
        let id: Int
        let aisle: String?
        let image: String?
        let consistency: String
        let name: String
        let nameClean: String
        let original: String
        let originalName: String
        let amount: Double
        let unit: String
        let meta: [String]
        let measures: Measure
    }
}

extension RandomRecipe.Recipe.ExtendedIngredient {
    struct Measure: Codable {
        let us: U
        let metric: Metric
    }
}

extension RandomRecipe.Recipe.ExtendedIngredient.Measure {
    struct U: Codable {
        let amount: Double
        let unitShort: String
        let unitLong: String
    }
}

extension RandomRecipe.Recipe.ExtendedIngredient.Measure {
    struct Metric: Codable {
        let amount: Double
        let unitShort: String
        let unitLong: String
    }
}

extension RandomRecipe.Recipe {
    struct AnalyzedInstruction: Codable {
        let name: String
        let steps: [Step]
    }
}

extension RandomRecipe.Recipe.AnalyzedInstruction {
    struct Step: Codable {
        let number: Int
        let step: String
        let ingredients: [Ingredient]
        let equipment: [Equipment]
        let length: Length?
    }
}

extension RandomRecipe.Recipe.AnalyzedInstruction.Step {
    struct Ingredient: Codable {
        let id: Int
        let name: String
        let localizedName: String
        let image: String
    }
}

extension RandomRecipe.Recipe.AnalyzedInstruction.Step {
    struct Equipment: Codable {
        let id: Int
        let name: String
        let localizedName: String
        let image: String
    }
}

extension RandomRecipe.Recipe.AnalyzedInstruction.Step {
    struct Length: Codable {
        let number: Int
        let unit: String
    }
}


class RandomRecipeViewModel: ObservableObject{
    
    @Published var tryDataRandomRecipe = RandomRecipe(recipes: [RandomRecipe.Recipe(vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, lowFodmap: false, weightWatcherSmartPoints: 0, gaps: "", preparationMinutes: 0, cookingMinutes: 0, aggregateLikes: 0, healthScore: 0, creditsText: "", sourceName: "", pricePerServing: 0.0, extendedIngredients: [RandomRecipe.Recipe.ExtendedIngredient(id: 0, aisle: "", image: "", consistency: "", name: "", nameClean: "", original: "", originalName: "", amount: 0.0, unit: "", meta: [""], measures: RandomRecipe.Recipe.ExtendedIngredient.Measure(us: RandomRecipe.Recipe.ExtendedIngredient.Measure.U(amount: 0.0, unitShort: "", unitLong: ""), metric: RandomRecipe.Recipe.ExtendedIngredient.Measure.Metric(amount: 0.0, unitShort: "", unitLong: "")))], id: 0, title: "", readyInMinutes: 0, servings: 0, sourceURL: "", image: "", imageType: "", summary: "", dishTypes: [""], diets: [""], instructions: "", analyzedInstructions: [RandomRecipe.Recipe.AnalyzedInstruction(name: "", steps: [RandomRecipe.Recipe.AnalyzedInstruction.Step(number: 0, step: "", ingredients: [RandomRecipe.Recipe.AnalyzedInstruction.Step.Ingredient(id: 0, name: "", localizedName: "", image: "")], equipment: [RandomRecipe.Recipe.AnalyzedInstruction.Step.Equipment(id: 0, name: "", localizedName: "", image: "")], length: RandomRecipe.Recipe.AnalyzedInstruction.Step.Length(number: 0, unit: ""))])], spoonacularSourceURL: "")])
    
    
    func fetchRandomRecipe(){
        let headers = [
            "X-RapidAPI-Key": "API KEY FROM RAPIDAPI.COM",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=1")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                do {
                    //print(data)
                    let tryDataRandomRecipe = try JSONDecoder().decode(RandomRecipe.self, from: data!)
                    OperationQueue.main.addOperation {
                        self.tryDataRandomRecipe = tryDataRandomRecipe
                        print(tryDataRandomRecipe.recipes.first!.extendedIngredients.first!.id)
                        
                    }
                    
                }
                catch{
                    print("Error ---> \(error)")
                }
            }
        })
        
        dataTask.resume()
    }
}
