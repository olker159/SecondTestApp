//
//  RandomRecipeGrid.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 05/10/2022.
//

import Foundation

struct RandomRecipeGrid: Codable {
  let recipes: [RecipeGrid]
}

extension RandomRecipeGrid {
  struct RecipeGrid: Codable, Identifiable {
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
    let aggregateLikes: Int
    let healthScore: Int
    let creditsText: String
    let license: String?
    let sourceName: String
    let pricePerServing: Double
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let image: String
    let imageType: String
    let summary: String
    let cuisines: [String]
    let dishTypes: [String]
    let diets: [String]
    let occasions: [String]
    let instructions: String

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
      case license
      case sourceName
      case pricePerServing
      case id
      case title
      case readyInMinutes
      case servings
      case image
      case imageType
      case summary
      case cuisines
      case dishTypes
      case diets
      case occasions
      case instructions
    }
  }
}






class RandomRecipeGridViewModel: ObservableObject{
    
    @Published var tryDataRandomRecipeGrid = RandomRecipeGrid(recipes: [RandomRecipeGrid.RecipeGrid(vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, lowFodmap: false, weightWatcherSmartPoints: 0, gaps: "", preparationMinutes: 0, cookingMinutes: 0, aggregateLikes: 0, healthScore: 0, creditsText: "", license: "", sourceName: "", pricePerServing: 0.0, id: 0, title: "", readyInMinutes: 0, servings: 0, image: "", imageType: "", summary: "", cuisines: [""], dishTypes: [""], diets: [""], occasions: [""], instructions: "")])
    
    
    func fetchRandomRecipe(){
        
        let headers = [
            "X-RapidAPI-Key": "41b3ea560cmsh559d6da4a23e211p1ac346jsnf1a85f6123ee",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?number=10")! as URL,
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
                    let tryDataRandomRecipeGrid = try JSONDecoder().decode(RandomRecipeGrid .self, from: data!)
                    OperationQueue.main.addOperation {
                        self.tryDataRandomRecipeGrid = tryDataRandomRecipeGrid
                        
                        
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
