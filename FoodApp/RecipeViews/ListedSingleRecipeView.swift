//
//  ListedSingleRecipeView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 28/09/2022.
//

import SwiftUI

struct ListedSingleRecipeView: View {
    
    var body: some View {
        ZStack{
            VStack{
                Image("almonds")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 175)
                    .zIndex(1)
                
                VStack {
                    Text("Dijon Garlic Brussels Sprouts")
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
        ListedSingleRecipeView()
            
    }
}
