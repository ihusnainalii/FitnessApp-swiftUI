//
//  CustomButton.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    var type: Int
    var isChecked: Bool = true
    var index: Int
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                if isChecked {
                    HStack {
                        if type == index {
                            Image("checkmark-wht")
                        } else {
                            Circle()
                                .fill(Color.black.opacity(0.20))
                                .frame(width: 30)
                        }
                        Text(title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                } else {
                    HStack {
                        Text(title)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.vertical,  10)
            .padding(.horizontal, isChecked ? 10 : 0)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(type == index ? .white : .blackColor)
            .background(type == index ? Color.blueColor : Color.lytgrayColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                CustomButton(title: "Title text", type: 0, isChecked: false, index: 0, action: {})
                CustomButton(title: "Title text", type: 2, isChecked: true, index: 1, action: {})
            }
            .padding()
            
            HStack {
                CustomButton(title: "Title text", type: 0, isChecked: false, index: 0, action: {})
                CustomButton(title: "Title text", type: 1, isChecked: false, index: 2, action: {})
                CustomButton(title: "Title text", type: 1, isChecked: false, index: 2, action: {})
            }
        }
    }
}
