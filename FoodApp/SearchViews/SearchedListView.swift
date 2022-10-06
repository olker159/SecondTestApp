//
//  SearchedListView.swift
//  FoodApp
//
//  Created by Oliver Pavlovsky on 06/10/2022.
//

import SwiftUI

struct SearchedListView: View {
    var body: some View {
    
        NavigationView {
            List{
                ForEach(1...10 , id: \.self){_ in
                    Text("aha aha aha")
                }
            }.navigationTitle("Results")
        }
    }
}

struct SearchedListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchedListView()
    }
}
