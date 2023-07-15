//
//  SwiftUIView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI
import Foundation


enum CustomFont: String {
    case black = "BarlowSemiCondensed-Black"
    case bold = "BarlowSemiCondensed-Bold"
    case medium = "BarlowSemiCondensed-Medium"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
