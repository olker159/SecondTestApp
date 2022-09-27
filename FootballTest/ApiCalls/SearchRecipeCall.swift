//
//  SearchRecipeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 23/09/2022.
//

import Foundation

struct Result: Codable {
    let asd: String
}


class SearchRecipeViewModel: ObservableObject {
    
    @Published var searchRecipeData = Result(asd: "")
    
    
    func fetchRecipe(){
        let headers = [
            "X-RapidAPI-Key": "API KEY FROM RAPIDAPI.COM",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=burger&diet=vegetarian&excludeIngredients=coconut&intolerances=egg%2C%20gluten&number=10&offset=0&type=main%20course")! as URL,
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
                    let searchRecipeData = try JSONDecoder().decode(Result.self, from: data!)
                    OperationQueue.main.addOperation {
                        self.searchRecipeData = searchRecipeData
                        //print(tryDataRandomRecipe.recipes.first!.extendedIngredients.first!.id)
                        
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
