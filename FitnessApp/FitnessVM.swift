//
//  FitnessVM.swift
//  FitnessApp
//
//  Created by Husnain Ali on 31/12/22.
//

import SwiftUI
import Foundation

class FitnessVM: ObservableObject {
    @Published var selectedGenderType: Int = 0
    @Published var selectedWorkoutPlaceType = 0
    @Published var selectedWorkoutPlanType = 0
    @Published var selectedSkillType = 0
    @Published var selectedNutritionType = 0
    @Published var selectedFoodType = 0
    @Published var selectedFoodTypeArr = []
    @Published var currentAge = 18.0
    @Published var currentHeight = 50.0
    @Published var currentWeight = 50.0
    
    
    let gender: [String] = [
        "Male",
        "Female",
        "Other"
    ]
    
    let nutrition:[String] = [
        "Veganism",
        "No Restrictions"
    ]
    
    let skillLevel:[String] = [
        "Noob",
        "Skilled",
        "Expert"
    ]
    
    let workoutPlan:[String] = [
        "Lose Weight",
        "Get Muscles",
        "Stay Healthy"
    ]
    
    let foodTypes: [String] = [
        "Fruits",
        "Fish",
        "Salad",
        "Dairy",
        "Chicken",
        "Protien"
    ]
    
    let foodIcons: [String] = [
        "apple",
        "fish",
        "vegetables",
        "milk",
        "chicken",
        "egg"
    ]
    
    let workoutIcons: [String] = [
        "home-icon",
        "gym-icon",
        "outdoor-icon"
    ]
    
    let workoutLocationTypes: [String] = [
        "Home",
        "Gym",
        "Outdoor"
    ]
    
    
    func convertToFeet(value: Int) -> String {
        let measurement = Measurement(value: Double(value), unit: UnitLength.inches)
        let meters = measurement.converted(to: .meters).value
        return LengthFormatter.imperialLengthFormatter.string(fromMeters: meters)
        
    }
    
    
    
}

extension LengthFormatter {
    public static let imperialLengthFormatter: LengthFormatter = {
        let formatter = LengthFormatter()
        formatter.unitStyle = LengthFormatter.UnitStyle.short
        formatter.isForPersonHeightUse = true
        return formatter
    }()
}
