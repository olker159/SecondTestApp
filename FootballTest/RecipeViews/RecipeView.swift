//
//  RecipeView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 23/09/2022.
//

import SwiftUI

struct RecipeView: View {
    
    @Binding var text: String
    
    var body: some View {
        
        VStack(){
            SearchBar()
            
            Spacer()
            
        }
        
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(text: .constant(""))
    }
}
