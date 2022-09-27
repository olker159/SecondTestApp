//
//  RandomRecipeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 16/09/2022.
//

import Foundation
import SwiftUI

// Main Structure
struct RandomRecipe: Codable {
    
    let recipes: [Recipes]
    
}

// First extension structure
extension RandomRecipe {
    
    struct Recipes: Codable {
        
        let vegetarian: Bool
        let vegan: Bool
        let glutenFree: Bool
        let dairyFree: Bool
        let veryHealthy: Bool
        let cheap: Bool
        let veryPopular: Bool
        let sustainable: Bool
        let preparationMinutes: Int
        let cookingMinutes: Int
        let extendedIngredients: [ExtendedIngredniets]
        let id: Int
        let title: String
        let readyInMinutes: Int
        let image: String
        let instructions: String
        
    }
    
}
// CodingKeys/enum to main struct
extension RandomRecipe.Recipes{

    
    
    
}

// extension to extended struct
extension RandomRecipe.Recipes {
    
    struct ExtendedIngredniets: Codable{
        
        let id: Int
        let aisle: String?
        let image: String
        let name: String
        let amount: Double
        let unit: String
        //let unitShort: String
        //let unitLong: String
        //let orgininalString: String
        
    }
}

// CodingKeys/enum to extended struct
extension RandomRecipe{
    
    enum aisle: String, Codable {
        case Nuts
    }
    enum image: String, Codable {
        case Image
    }
    enum name: String, Codable {
        case almonds
    }
    enum unit: String, Codable {
        case cup
    }
    enum title: String, Codable {
        case title
    }
    enum unitShort: String, Codable {
        case cups
    }
    enum unitLong: String, Codable {
        case cups
    }
    enum originalString: String, Codable {
        case SlicedAlmonds
    }
    enum instructions: String, Codable {
        case instructions
    }
    
    
}
extension RandomRecipe.Recipes.ExtendedIngredniets{
    enum image: String, Codable {
        case Image
    }
}


class RandomRecipeViewModel: ObservableObject{
    
    @Published var tryDataRandomRecipe = RandomRecipe(recipes: [RandomRecipe.Recipes(vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, preparationMinutes: 0, cookingMinutes: 0, extendedIngredients: [RandomRecipe.Recipes.ExtendedIngredniets(id: 0, aisle: "", image: "", name: "", amount: 0.0, unit: ""/*, unitShort: "", unitLong: "", orgininalString: ""*/)], id: 0, title: "", readyInMinutes: 0, image: "", instructions: "")])
    
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
