//
//  ExercisesView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 09/09/2022.
//

import SwiftUI

struct WinePairingView: View {
    @StateObject var wineParingViewModel = WinePairingViewModel()
    var body: some View {
        NavigationView {
            ForEach(wineParingViewModel.wineResultData.productMatches){ item in
                
                Text(item.title + "\n")
                
                    
            }
            .navigationTitle("Wine pairings to dish")
        }.onAppear(perform: wineParingViewModel.fecthWines)
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        WinePairingView()
    }
}
