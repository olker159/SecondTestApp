//
//  MainView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 13/09/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house")
                    }
                    
                }
            RecipesView()
                .tabItem {
                    Label {
                        Text("Recipes")
                    } icon: {
                        Image(systemName: "fork.knife")
                    }
                }
            IngredientsView()
                .tabItem{
                    Label {
                        Text("Ingredients")
                    } icon: {
                        Image(systemName: "carrot")
                    }
                    
                }
        }.accentColor(.green)
            
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
