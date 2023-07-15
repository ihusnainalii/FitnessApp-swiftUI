//
//  PersonalInfoVIew.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct PersonalInfoVIew: View {
    @EnvironmentObject var vm: FitnessVM
    var body: some View {
        ScrollView {
            VStack {
                Text("Personal")
                    .font(.custom(.bold, size: 30))
                + Text(" Info")
                    .font(.custom(.bold, size: 30))
                    .foregroundColor(.blueColor)
                
                
                genderView
                
                SliderSectionView(value: $vm.currentAge, title: "Age", range: 18...60)
                    .environmentObject(vm)
                SliderSectionView(value: $vm.currentHeight, title: "Height", range: 50...200)
                    .environmentObject(vm)
                SliderSectionView(value: $vm.currentWeight, title: "Weight", range: 20...120)
                    .environmentObject(vm)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bgColor)
    }
    
    var genderView: some View {
        
        VStack(alignment: .leading) {
            
            Text("Select yout gender")
            
            ForEach(0..<vm.gender.count, id: \.self) { index in
                CustomButton(title: vm.gender[index], type: vm.selectedGenderType, index: index, action: {
                    self.vm.selectedGenderType = index
                })
                if index != vm.gender.count - 1 {
                    Spacer()
                }
            }
        }
        .font(.custom(.medium, size: 20))
        .padding(15)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
    
}

struct PersonalInfoVIew_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoVIew()
            .environmentObject(FitnessVM())
    }
}
