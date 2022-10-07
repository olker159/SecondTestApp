//
//  SingleSearchedRecipe.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 07/10/2022.
//

import SwiftUI

struct SingleSearchedRecipe: View {
    
    @StateObject var searchedRecipe = SearchRecipeViewModel()
    
    var title: String
    var image: String
    
    var body: some View {
        
        HStack(spacing: -1.5){
            AsyncImage(url: URL(string: image)) { item in
                item.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 175, height: 120)
                    .cornerRadius(15)
                    .zIndex(1)
                    
            } placeholder: {
                ZStack {
                    
                    Image(systemName: "questionmark.folder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        //.cornerRadius(15)
                        .foregroundColor(.gray)
                        .zIndex(1)
                    Color("TabColor")
                        .frame(width: 175, height: 120)
                        .cornerRadius(15)
                }
            }.zIndex(1)
            
            VStack {
                Text(title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .lineLimit(4)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 150)
                    
            }.frame(maxHeight: 75)
            .background(Color("TabColor").frame(width: 175,height: 120).cornerRadius(15))
            
        }
        
    }
}

struct SingleSearchedRecipe_Previews: PreviewProvider {
    static var previews: some View {
        SingleSearchedRecipe(title: "", image: "")
    }
}
