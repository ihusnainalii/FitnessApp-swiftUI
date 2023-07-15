//
//  SliderSectionView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 01/01/23.
//

import SwiftUI

struct SliderSectionView: View {
    
    @EnvironmentObject var vm:FitnessVM
    @Binding var value: Double
    var title: String
    var range: ClosedRange<Double> = 1...100
    var isHeightSection: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.custom(.medium, size: 18))
                    .padding(.leading, 15)
                
                Spacer()
                
                Text("\(value, specifier: "%.0f")")
                    .font(.custom(.black, size: 24))
                    .padding(.trailing, 15)
            }
            CustomSliderView(value: $value, range: range)
        }
        .frame(height: 100)
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 15)
    }
}

struct SliderSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SliderSectionView(value: .constant(100.0), title: "Title text", range: 100...250)
            .environmentObject(FitnessVM())
            
    }
}
