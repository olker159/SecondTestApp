//
//  RoundedShape.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 08/09/2022.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 50, height: 50))
        
        return Path(path.cgPath)
    }
}

