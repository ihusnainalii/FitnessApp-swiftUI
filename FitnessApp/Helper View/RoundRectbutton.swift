//
//  RoundRectbutton.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct RoundRectbutton: View {
    var title: String
    var icon: String
    var type: Int
    var index: Int
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                HStack {
                    Spacer()
                    if type == index {
                        Image("checkmark-wht")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Circle()
                            .fill(Color.black.opacity(0.20))
                            .frame(width: 20)
                    }
                }
                .padding(.trailing, 10)
                .offset(y: -5)
                
                
                VStack {
                    Image(icon)
                        .renderingMode(.template)
                    Text(title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom(.medium, size: 15))
                }
            }
        }
        .padding(.vertical, 10)
        .frame(height: 100)
        .foregroundColor(type == index ? Color.white : Color.blueColor)
        .background(type == index ? Color.blueColor : Color.lytgrayColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 5)
    }
}

struct RoundRectbutton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            RoundRectbutton(title: "Title text", icon: "home-icon", type: 0, index: 0, action: {})
            RoundRectbutton(title: "Title text", icon: "outdoor-icon", type: 0, index: 1, action: {})
        }
    }
}
