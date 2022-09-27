//
//  SearchBar.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 22/09/2022.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""

        var body: some View {
            NavigationView {
                Text("Searching for \(searchText)")
                    .searchable(text: $searchText)
                    .navigationTitle("Recipe Search")
            }
        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .previewLayout(.sizeThatFits)
    }
}

