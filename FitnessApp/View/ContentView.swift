//
//  ContentView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = FitnessVM()
    @State var currentPage: Int = 0
    var body: some View {
        VStack {
            tabView
            navBar
        }
        .background(Color.bgColor.ignoresSafeArea(.all))
    }
    
    var tabView: some View {
        TabView(selection: $currentPage) {
            PersonalInfoVIew()
                .environmentObject(vm)
                .tag(0)
            WorkoutInfoView()
                .environmentObject(vm)
                .tag(1)
            FoodPrefView()
                .environmentObject(vm)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    var navBar: some View {
        HStack {
            HStack {
                ForEach(0..<3, id: \.self) { index in
                    DotView(currentpage: $currentPage, index: index)
                }
            }
            Spacer()
            HStack {
                NavButton(type: .previous) {
                    currentPage -= 1
                }
                .opacity(currentPage > 0 ? 1 : 0)
                NavButton(type: .next) {
                    currentPage += 1
                }
                .opacity(currentPage == 2 ? 0 : 1)
            }
        }
        .padding(15)
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
