//
//  RandomJokeCall.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 14/09/2022.
//

import Foundation
import SwiftUI

struct Joke: Codable{
    var text: String
}


class JokeViewModel: ObservableObject{
    
    @Published var tryDataJoke = Joke(text: "")
    
    func fetchRandomJoke(){
        
        let headers = [
            "X-RapidAPI-Key": "41b3ea560cmsh559d6da4a23e211p1ac346jsnf1a85f6123ee",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/jokes/random")! as URL,
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
                    let tryDataJoke = try JSONDecoder().decode(Joke.self, from: data!)
                    OperationQueue.main.addOperation {
                        self.tryDataJoke = tryDataJoke
                        //print(tryDataJoke.text)
                        
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
