//
//  ListedSingleRecipeView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 28/09/2022.
//

import SwiftUI

struct ListedSingleRecipeView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    @StateObject var randomRecipeGridViewModel = RandomRecipeGridViewModel()
    
    @State var image: String
    @State var title: String
    
    var body: some View {
        ZStack{
            VStack{
                
                AsyncImage(url: URL(string: image)) { item in
                    item.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 175, maxHeight: 120)
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
                            .frame(maxWidth: 175, maxHeight: 120)
                            .cornerRadius(15)
                    }
                }.zIndex(1)
                /*
                Image("almonds")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 175)
                    .zIndex(1)
                */
                VStack {
                    Text(title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 150)
                        .padding()
                    Spacer()
                }.frame(maxHeight: 75)
                .background(Color("TabColor").frame(width: 175,height: 125).cornerRadius(15))
            }
        }
    }
}

struct ListedSingleRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ListedSingleRecipeView(image: "", title: "")
            
    }
}
