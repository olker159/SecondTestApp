//
//  RandomJokeView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 13/09/2022.
//

import SwiftUI

struct TextWithBackgroundView: View {
    
    @StateObject var jokeViewModel = JokeViewModel()
    var text: String
    
    var body: some View {
        
            
            Text("""
\(text)
""")
            .padding(20)
            .background(Rectangle().foregroundColor(Color("TabColor")).frame(maxWidth: 375, minHeight: 148, idealHeight: 168).shadow(radius: 3).cornerRadius(25))
            

            
    }
}



struct TextWithBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackgroundView(text: "Remember: You can eat your way out of almost any problem.")

        
    }
}
