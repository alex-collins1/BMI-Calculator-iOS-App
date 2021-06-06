//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Alex Collins on 04/06/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI? // BMI? is the BMI struct in the other model file //
     
    
    func getBMIValue() -> String {
        // if bmi has a value it will show the value, if it doesnt it will show "0.0", ?? basically means otheriwse. //
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
            return bmiTo1DecimalPlace
        
        
     }
    
    func getAdvice() -> String {
        // ?? "No advice" will catch an error if bmi = 0 and stop the app from crashing //
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float)  {
         let bmiValue  = weight / (height * height)
        
        if bmiValue < 18.5 {
              bmi = BMI(value: bmiValue, advice:"You are underweight"  , color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            
        } else if bmiValue < 24.9 {
             bmi = BMI(value: bmiValue, advice:"You are normal!"  , color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice:"You are obese!"  , color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }

    }
    
   

}



