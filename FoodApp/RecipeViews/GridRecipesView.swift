//
//  GridRecipesView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 30/09/2022.
//

import SwiftUI

struct GridRecipesView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    @StateObject var randomRecipeGridViewModel = RandomRecipeGridViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 50) {
                    ForEach(randomRecipeGridViewModel.tryDataRandomRecipeGrid.recipes) { item in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            ListedSingleRecipeView(image: item.image, title: item.title)
                        }

                    }
                }
            }.onAppear{randomRecipeGridViewModel.fetchRandomRecipe()}
        }
        
    }
}

struct GridRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        GridRecipesView()
    }
}
