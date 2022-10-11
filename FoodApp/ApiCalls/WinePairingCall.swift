//
//  WinePairingCall.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 11/10/2022.
//

import Foundation


import Foundation

struct WineResult: Codable {
  let pairedWines: [String]
  let pairingText: String
  let productMatches: [ProductMatch]
}

extension WineResult {
  struct ProductMatch: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let imageURL: String
    let averageRating: Double
    let ratingCount: Int
    let score: Double
    let link: String

    private enum CodingKeys: String, CodingKey {
      case id
      case title
      case description
      case price
      case imageURL = "imageUrl"
      case averageRating
      case ratingCount
      case score
      case link
    }
  }
}


class WinePairingViewModel: ObservableObject {
    
    @Published var wineResultData = WineResult(pairedWines: [""], pairingText: "", productMatches: [WineResult.ProductMatch(id: 0, title: "", description: "", price: "", imageURL: "", averageRating: 0.0, ratingCount: 0, score: 0.0, link: "")])
    
    func fecthWines() {
        
        let headers = [
            "X-RapidAPI-Key": "API KEY FROM RAPIDAPI.COM",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/wine/pairing?food=steaks")! as URL,
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
                    let wineResultData = try JSONDecoder().decode(WineResult.self, from: data!)
                    OperationQueue.main.addOperation {
                        self.wineResultData = wineResultData
                       //print(tryData.text)
                        
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
