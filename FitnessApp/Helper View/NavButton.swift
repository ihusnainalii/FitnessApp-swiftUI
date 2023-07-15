//
//  NavButton.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

enum ButtonType: String {
    case previous = "Previous"
    case next = "Next"
}



struct NavButton: View {
    var type: ButtonType
    var action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text(type.rawValue)
                .font(.custom(.bold, size: 18))
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .foregroundColor(type == .next ? .white : .blueColor)
                .background(type == .next ? Color.blueColor : Color.white)
        }
        .buttonStyle(.plain)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(type == .next ? .white : .blueColor)
            .opacity(type == .next ? 0 : 1)
            )
        .shadow(radius: 2, x: 1 ,y: 2)

    }
}

struct NavButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                NavButton(type: .previous, action: {})
                NavButton(type: .next, action: {})
            }
            .padding()
            HStack {
                DotView(currentpage: .constant(0), index: 1)
                DotView(currentpage: .constant(1), index: 1)
            }
        }
    }
}

// MARK: - DotView
struct DotView: View {
    @Binding var currentpage: Int
    let index: Int
    var body: some View {
        Circle()
            .fill(checkCurrentPage())
            .frame(width: 10, height: 10)
    }
    
    
    // MARK: - checkCurrentPage
    func checkCurrentPage() -> Color {
        if index == currentpage {
            return .black
        }
        return .black.opacity(0.10)
    }
}
