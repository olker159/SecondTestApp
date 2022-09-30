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
    
    var body: some View {
        
        NavigationView {
            VStack{
                HStack {
                    SearchBar(text: $searchText)
                        .autocorrectionDisabled(true)
                        .padding(.leading,5)
                    Button {
                        textTest = searchText
                    } label: {
                        Text("Search")
                            .foregroundColor(.black)
                            .frame(width: 75, height: 37)
                            .background(Color("TabColor"))
                            .cornerRadius(12)
                            .padding(.trailing,5)
                            
                    }

                }.padding(.top,10)
                
                
                Text("Suggested recipes")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .padding(.top, 15)
                
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
