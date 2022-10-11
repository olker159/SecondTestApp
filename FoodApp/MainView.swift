//
//  MainView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 13/09/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var randomRecipeViewModel = RandomRecipeViewModel()
    @StateObject var randomRecipeGridViewModel = RandomRecipeGridViewModel()
    
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house")
                    }
                    
                }
            RecipesView()
                .tabItem {
                    Label {
                        Text("Recipes")
                    } icon: {
                        Image(systemName: "fork.knife")
                    }
                }
            WinePairingView()
                .tabItem{
                    Label {
                        Text("Wines")
                    } icon: {
                        Image(systemName: "wineglass.fill")
                    }
                    
                }
        }.accentColor(.green)
            .onAppear{
                
            }
            
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
