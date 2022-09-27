//
//  FoodView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 09/09/2022.
//

import SwiftUI

struct RecipesView: View {
    @State var searchText = ""
    var body: some View {
        VStack{
            HStack {
                SearchBar(text: $searchText)
                    .autocorrectionDisabled(true)
                Button {
                    print(searchText)
                } label: {
                    Text("Button")
                        .foregroundColor(.black)
                        .frame(width: 75, height: 35)
                        .background(Color("TabColor"))
                        .cornerRadius(12)
                        .padding(.trailing)
                        
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
