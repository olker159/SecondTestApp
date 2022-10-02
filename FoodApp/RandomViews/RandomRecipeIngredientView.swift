//
//  RandomRecipeIngredientView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 15/09/2022.
//

import SwiftUI

struct RandomRecipeIngredientView: View {
    
    
    @State var image: String
    var name: String
    var amount: Double
    var unit: String
    var unitLong: String
    
    var body: some View {
        
        ZStack{
            
            HStack {
                
                AsyncImage(url: URL(string: image)) { item in
                    item.resizable()
                    item.scaledToFit()
                } placeholder: {
                    ZStack {
                        Image(systemName: "questionmark.folder")
                            .resizable()
                            .scaledToFit().frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                            .zIndex(1)
                        Color("TabColor")
                    }
                }
                /*Image("almonds")
                    .resizable()
                    .scaledToFit()*/
                .cornerRadius(15)
                .frame(width: 200, height: 130)
                .zIndex(1)
                
                
                
                VStack{
                    
                    Text("Name: \(name)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Amount: \(amount,specifier: "%.2f")")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    if amount > 1 {
                        Text("Unit: \(unit)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }else{
                        Text("Unit: \(unitLong)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    
                    
                }.frame(maxWidth: 120)
                .background(Color("TabColor").frame(width: 180,height: 130).cornerRadius(15))
                    .padding(.trailing)
                
                
            }
        }
    }
}

struct RandomRecipeIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipeIngredientView(image: "", name: "", amount: 0.0, unit: "", unitLong: "")
    }
}
