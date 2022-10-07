//
//  FoodView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 09/09/2022.
//

import SwiftUI

struct RecipesView: View {
    
    @State var searchText = ""
    @State var textTest = ""
    //@State var isClicked: Bool = false
    
    @FocusState private var searchFocus: Bool
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    @State private var buttonOpacity = 1.0
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack {
                    SearchBar(text: $searchText)
                        .autocorrectionDisabled(true)
                        .padding(.leading,5)
                        .padding(.top,15)
                        .focused($searchFocus)
                    
                    
                        NavigationLink {
                            SearchedListView(query: searchText)
                        } label: {
                            Text("Search")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(width: 75, height: 37)
                                .background(Color("TabColor"))
                                .cornerRadius(12)
                                .padding(.trailing,5)
                                .padding(.top,15)
                        }
                        
                   /* Button {
                        textTest = searchText
                        searchFocus = false
                        isClicked = true
                        
                    } label: {
                        Text("Search")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(width: 75, height: 37)
                            .background(Color("TabColor"))
                            .cornerRadius(12)
                            .padding(.trailing,5)
                            .padding(.top,15)
                    }*/
                }.padding(.top,10)
                
                Text("Suggested recipes")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.top, 15)
                
                GridRecipesView()
                    .onAppear{
                        
                    }
                
                Spacer()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Search for recipes")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                    
                }
            }
            
            
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
