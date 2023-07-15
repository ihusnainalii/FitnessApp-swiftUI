//
//  Color++.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import Foundation
import SwiftUI

extension Color {
    static let bgColor = Color("bgColor")
    static let lytgrayColor = Color("lytgrayColor")
    static let blueColor = Color("blueColor")
    static let blackColor = Color("blackColor")
}

extension UIColor {
    static let bgColor = Color("bgColor")
    static let lytgrayColor = Color("lytgrayColor")
    static let blueColor = Color("blueColor")
    static let blackColor = Color("blackColor")

    private static func Color(_ key: String) -> UIColor {
        if let color = UIColor(named: key, in: .main, compatibleWith: nil) {
            return color
        }
        
        return .black
    }
}
