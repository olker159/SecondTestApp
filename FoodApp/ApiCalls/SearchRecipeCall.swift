//
//  SearchRecipeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 23/09/2022.
//

import Foundation


struct SearchResult: Codable {
  let results: [Result]
  let baseUri: String
  let offset: Int
  let number: Int
  let totalResults: Int
  let processingTimeMs: Int
}

extension SearchResult {
  struct Result: Codable, Identifiable {
    let id: Int
    let title: String
    let readyInMinutes: Int
    let servings: Int
    let sourceURL: String
    let image: String

    private enum CodingKeys: String, CodingKey {
      case id
      case title
      case readyInMinutes
      case servings
      case sourceURL = "sourceUrl"
      case image
    }
  }
}

class SearchRecipeViewModel: ObservableObject {
    
    @Published var searchRecipeData = SearchResult(results: [SearchResult.Result(id: 0, title: "", readyInMinutes: 0, servings: 0, sourceURL: "", image: "")], baseUri: "", offset: 0, number: 0, totalResults: 0, processingTimeMs: 0)
    
    
    func fetchRecipe(query: String){
        let headers = [
            "X-RapidAPI-Key": "API KEY FROM RAPIDAPI.COM",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=\(query)&number=10&offset=0")! as URL,
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
