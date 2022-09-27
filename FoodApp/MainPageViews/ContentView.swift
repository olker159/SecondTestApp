//
//  ContentView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 06/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var jokeViewModel = JokeViewModel()
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()

    
    var trivia: String = """
Pringles were first sold in America in 1968 but were not popular until the mid 1970’s.
"""
    
    var body: some View {
        
        ScrollView {
            VStack{
                
                TopBarView(title: "Welcome to my App!")
                    .padding(.bottom,30)
                //Spacer()
                
                Text("Here is a random food joke to lighten up your day!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom,50)
                    .multilineTextAlignment(.center)
                
                TextWithBackgroundView(text: jokeViewModel.tryDataJoke.text)
                    .padding()
                    .padding(.bottom,50)
                    .onAppear{
                        jokeViewModel.fetchRandomJoke()
                    }
                
                
                
                Text("Did you know...?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom,50)
                
                TextWithBackgroundView(text: viewModel.tryData.text)
                    .padding()
                    .padding(.bottom,75).onAppear{
                        viewModel.fecth()
                    }
                

                Text("Here is a random recipe!")
                    .font(.title2)
                    .fontWeight(.bold)
                Image("fast-food")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom,30)
                    
                RandomRecipeView()
                    
                
    
                    
                
                Spacer()
                
                
                
                
            }
            
        }.ignoresSafeArea()
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
