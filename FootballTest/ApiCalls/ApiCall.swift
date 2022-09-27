//
//  ApiCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 09/09/2022.
//


import Foundation
import SwiftUI

struct Trivia: Codable{
    
    let text: String

}

class ViewModel: ObservableObject {
    
    @Published var tryData = Trivia(text: "")
    
    func fecth() {
        
        let headers = [
            "X-RapidAPI-Key": "API KEY FROM RAPIDAPI.COM",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/trivia/random")! as URL,
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
                    let tryData = try JSONDecoder().decode(Trivia.self, from: data!)
                    OperationQueue.main.addOperation {
                        self.tryData = tryData
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



//
//{
//  "type": "product",
//  "products": [
//    {
//      "id": 177546,
//      "title": "SNICKERS SINGLES 2.07 OUNCE",
//      "image": "https://spoonacular.com/productImages/177546-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 130183,
//      "title": "Snickers Almond Singles Size Chocolate Candy Bars, 1.76 Oz",
//      "image": "https://spoonacular.com/productImages/130183-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 128388,
//      "title": "Snickers Milk Chocolate Easter Minis, 11.5 Oz.",
//      "image": "https://spoonacular.com/productImages/128388-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 127042,
//      "title": "Snickers Fun Size Chocolate Bars, 4.62 Oz.",
//      "image": "https://spoonacular.com/productImages/127042-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 126618,
//      "title": "Snickers Original Chocolate Candy Bars Fun Size, 22.55 Oz.",
//      "image": "https://spoonacular.com/productImages/126618-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 181693,
//      "title": "Snickers, Milk Chocolate Candy Bar, Sharing Size, 3.29 Ounce",
//      "image": "https://spoonacular.com/productImages/181693-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 126586,
//      "title": "Mars Snickers Mini Halloween Milk Chocolate Candy Bar, 11.5 Oz.",
//      "image": "https://spoonacular.com/productImages/126586-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 128368,
//      "title": "Mars Snickers Minis Valentine Exchange Candy Bar, 11.5 Oz.",
//      "image": "https://spoonacular.com/productImages/128368-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 946767,
//      "title": "Larabar Snicker doodle 5CT Multipack",
//      "image": "https://spoonacular.com/productImages/946767-312x231.jpeg",
//      "imageType": "jpeg"
//    },
//    {
//      "id": 683131,
//      "title": "Mars Inc Snickers Creamy Almond Share Size",
//      "image": "https://spoonacular.com/productImages/683131-312x231.jpeg",
//      "imageType": "jpeg"
//    }
//  ],
//  "offset": 0,
//  "number": 10,
//  "totalProducts": 25,
//  "processingTimeMs": 270,
//  "expires": 1663275316184,
//  "isStale": false
//}
