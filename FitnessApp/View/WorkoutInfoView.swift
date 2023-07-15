//
//  WorkoutInfoView.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI

struct WorkoutInfoView: View {
    @EnvironmentObject var vm: FitnessVM
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Workout")
                    .font(.custom(.bold, size: 30))
                + Text(" Info")
                    .font(.custom(.bold, size: 30))
                    .foregroundColor(.blueColor)
                
                workoutPlaceView
                
                workoutReasonView
                
                skillTypeView
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bgColor)
    }
    
    //MARK: - workoutPlaceView
    var workoutPlaceView: some View {
        VStack(alignment: .leading) {
            Text("Workout place")
                .font(.custom(.medium, size: 20))
            
            LazyVGrid(columns: columns) {
                ForEach(0..<3) { index in
                    RoundRectbutton(title: vm.workoutLocationTypes[index], icon: vm.workoutIcons[index], type: vm.selectedWorkoutPlaceType, index: index, action: {
                        self.vm.selectedWorkoutPlaceType = index
                    })
                }
            }
        }
        .padding(15)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
    }
    
    //MARK: - workoutReasonView
    var workoutReasonView: some View {
        VStack(alignment: .leading) {
            Text("Select Workout plan")
                .font(.custom(.medium, size: 20))
            
            ForEach(0..<vm.workoutPlan.count, id: \.self) { index in
                CustomButton(title: vm.workoutPlan[index], type: vm.selectedWorkoutPlanType, index: index, action: {
                    self.vm.selectedWorkoutPlanType = index
                })
            }
        }
        .padding(15)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
    }
    
    //MARK: - skillTypeView
    var skillTypeView: some View {
        VStack(alignment: .leading) {
            Text("Select your skill level")
                .font(.custom(.medium, size: 20))
            
            HStack {
                ForEach(0..<vm.skillLevel.count, id: \.self) { index in
                    CustomButton(title: vm.skillLevel[index], type: vm.selectedSkillType,isChecked: false, index: index) { self.vm.selectedSkillType = index  }
                    
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

struct WorkoutInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutInfoView()
            .environmentObject(FitnessVM())
    }
}
