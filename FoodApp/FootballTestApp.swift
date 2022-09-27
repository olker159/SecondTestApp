//
//  FootballTestApp.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 06/09/2022.
//

import SwiftUI

@main
struct FootballTestApp: App {
    
    @StateObject var jokeViewModel = JokeViewModel()
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            RecipesView()
                .onAppear{
                    
                }
            
        }
    }
}
