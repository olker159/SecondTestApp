//
//  RandomRecipeVIEW.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 14/09/2022.
//

import SwiftUI

struct RandomRecipeView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()

    
    var body: some View {
        
        ScrollView {
            ZStack {
                //Color("TabColor")
                VStack{
                    Text(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    VStack{
                        Text("This food is ready in \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.readyInMinutes) minutes!")
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.top,1)
                        
                        Divider()
                            .frame(width: 275)
                        
                        HStack{
                            Spacer()
                            Text("Preparation minutes: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.preparationMinutes)")
                                .font(.callout)
                                .fontWeight(.light)
                                .padding()
                            
                            Spacer()
                            
                            Text("Cooking minutes: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.cookingMinutes)")
                                .font(.callout)
                                .fontWeight(.light)
                            Spacer()
                            Spacer()
                        }
                        
                    }
                    
                    
                    
                    VStack{
                        
                        Text("Informations")
                            .font(.title2)
                            .fontWeight(.regular)
                            .padding()
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                Text("Vegetarian: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.vegetarian ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Vegan: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.vegan ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Gluten Free: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.glutenFree ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Dairy Free: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.dairyFree ? "yes":"no")")
                                
                                
                            }
                            Spacer()
                            Divider()
                            Spacer()
                            
                            VStack(alignment: .leading){
                                Text("Very Healthy: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.veryHealthy ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Cheap: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.cheap ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Very Popular: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.veryPopular ? "yes":"no")")
                                    .padding(.bottom,5)
                                Text("Sustainable: \(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.sustainable ? "yes":"no")")
                                
                            }
                            
                        }
                        
                    }
                    .padding()
                    .background(Rectangle().foregroundColor(Color("TabColor")).frame(maxWidth: 375, idealHeight: 168).shadow(radius: 3).cornerRadius(25))
                    .padding(.leading)
                    .padding(.trailing)
                    
                    
                    
                    
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.regular)
                        .padding()
                    
                    ForEach(randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.extendedIngredients, id: \.id) { item in
                        
                        RandomRecipeIngredientView(image: item.image!, name: item.name, amount: item.amount, unit: item.unit, unitLong: "")
                            .padding(.trailing)
                        
                        
                       
                    }
                    
                    
                    
                    Text("Preparation")
                        .font(.title2)
                        .fontWeight(.regular)
                        .padding(.top)
                    
                    
                    TextWithBackgroundView(text: randomRecipeViewModel.tryDataRandomRecipe.recipes.first!.instructions)
                        .padding()
                    
                    
                    
                    
                }
            }
            .ignoresSafeArea()
            
            
        }
        .onAppear{
            randomRecipeViewModel.fetchRandomRecipe()
        }
    }
}

struct RandomRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomRecipeView()
    }
}
