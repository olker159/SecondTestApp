//
//  SearchedListView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 06/10/2022.
//

import SwiftUI

struct SearchedListView: View {
    
    @StateObject var searchedRecipe = SearchRecipeViewModel()
    
    var query: String
    
    var body: some View {
    
        NavigationView {
            List{
                ForEach(searchedRecipe.searchRecipeData.results){ item in
                    Text(item.title)
                }
            }.navigationTitle("Results")
        }.onAppear{
            searchedRecipe.fetchRecipe(query: query)
        }
    }
}

struct SearchedListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedListView(query: "")
    }
}
