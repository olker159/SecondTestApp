//
//  TopBarMenu.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 08/09/2022.
//

import SwiftUI

struct TopBarView: View {
    
    let title: String
    
    var body: some View {
        
        
        VStack{
            HStack{Spacer()}
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.medium)
        }
        .frame(height: 175)
        .background(Color.green)
        .clipShape(RoundedShape(corners: [.bottomRight, .bottomLeft]))
        .shadow(color: .green.opacity(0.5), radius: 10, x: 0, y: 15)
        .navigationBarHidden(true)
        

    }
    
    
}

struct TopBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(title: "Welcome to my app!")
    }
}
