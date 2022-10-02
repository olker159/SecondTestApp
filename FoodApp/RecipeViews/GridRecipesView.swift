//
//  GridRecipesView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 30/09/2022.
//

import SwiftUI

struct GridRecipesView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 50) {
                    ForEach(1 ... 10, id: \.self) {_ in
                        ListedSingleRecipeView()
                    }
                }
            }
        }
        
    }
}

struct GridRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        GridRecipesView()
    }
}
