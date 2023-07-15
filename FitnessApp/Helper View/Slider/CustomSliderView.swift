//
//  SliderView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 01/01/23.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var value: Double
    var range: ClosedRange<Double> = 1...100
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                HStack(spacing: (UIScreen.main.bounds.width - 160) / 55) {
                    ForEach(0..<51, id: \.self) { i in
                        Rectangle()
                            .fill(i % 5 == 0 ? Color.black.opacity(0.50) : Color.black.opacity(0.3))
                            .frame(width: 2, height: i % 5 == 0 ? 20: 12)
                    }
                }
                SliderView(value: $value, sliderRange: range, thumbColor: .blueColor, minTrackColor: .clear, maxTrackColor: .clear)
                    .padding(.horizontal, 20)
                    .frame(height: 35)
                
            }
        }
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(100.0), range: 100...300)
    }
}
