//
//  SearchRecipeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 23/09/2022.
//

import Foundation

struct SearchResult: Codable {
  let results: [Result]
  let offset: Int
  let number: Int
  let totalResults: Int
}

extension SearchResult {
  struct Result: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
  }
}

class SearchRecipeViewModel: ObservableObject {
    
    @Published var searchRecipeData = SearchResult(results: [SearchResult.Result(id: 0, title: "", image: "")], offset: 0, number: 0, totalResults: 0)
    
    
    func fetchRecipe(query: String){
        let headers = [
            "X-RapidAPI-Key": "41b3ea560cmsh559d6da4a23e211p1ac346jsnf1a85f6123ee",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch?query=\(query)")! as URL,
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
                    let searchRecipeData = try JSONDecoder().decode(SearchResult.self, from: data!)
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
