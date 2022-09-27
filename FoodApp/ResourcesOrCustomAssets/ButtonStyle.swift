//
//  ButtonStyle.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 07/09/2022.
//

import Foundation
import SwiftUI


struct styleOfButton: ButtonStyle {
    
    @State var buttonColor: Color = .green
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
                    .font(.title.bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(buttonColor)
                    .cornerRadius(25)
                    .overlay {
                        if configuration.isPressed {
                            Color(white: 1.0, opacity: 0.4)
                                .cornerRadius(12)
                        }
                    }
    }
    
}
