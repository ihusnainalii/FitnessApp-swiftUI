//
//  FoodPrefView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct FoodPrefView: View {
    @EnvironmentObject var vm: FitnessVM
    var column = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ScrollView {
            VStack {
                Text("Food Preference")
                    .font(.custom(.bold, size: 30))
                
                
                nutritionView
                
                foodView
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bgColor)
    }
    
    //MARK: - nutritionView
    var nutritionView: some View {
        VStack(alignment: .leading) {
            
            Text("Nutrition")
                .font(.custom(.medium, size: 20))
            
            ForEach(0..<vm.nutrition.count, id: \.self) { index in
                CustomButton(title: vm.nutrition[index], type: vm.selectedNutritionType, index: index, action: {
                    self.vm.selectedNutritionType = index
                })
            }
        }
        .padding(15)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
    }
    
    //MARK: - foodView
    var foodView: some View {
        VStack(alignment: .leading) {
            Text("What do you like?")
                .font(.custom(.medium, size: 20))
            
            LazyVGrid(columns: column) {
                ForEach(0..<vm.foodTypes.count) { index in
                    RoundRectbutton(title: vm.foodTypes[index], icon: vm.foodIcons[index], type: vm.selectedFoodType, index: index) {
                        self.vm.selectedFoodType = index
                        vm.selectedFoodTypeArr.append(index)
                        print(vm.selectedFoodTypeArr)
                    }
                }
            }
        }
        .padding(15)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
    }
    
    
    
    
    
}

struct FoodPrefView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPrefView()
            .environmentObject(FitnessVM())
    }
}
