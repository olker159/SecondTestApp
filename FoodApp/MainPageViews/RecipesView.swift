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
                        Text("Button")
                            .foregroundColor(.black)
                            .frame(width: 75, height: 37)
                            .background(Color("TabColor"))
                            .cornerRadius(12)
                            .padding(.trailing,5)
                            
                    }

                }.padding(.top,10)
                Spacer()
                
                Text("---> \(textTest)")
                
                Spacer()
                
            }
            .navigationTitle("Search for recipes")
            
            
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
