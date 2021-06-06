//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // see stack overflow- rounds the senders value to 2 decimal places //
        let  height =  String(format: "%.2f", sender.value)
        //  using string interpolation this will allow the sign metre (m) to be shown after the variable height, height = IBOUtlet of the height slider //
        heightLabel.text = "\(height)m"
        

    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        // see stack overflow- rounds send value  down to whole number- the value is used as in the playground area- we are changing the value //
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)KG"

    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        // this will calculate bmi when button is pressed, weight variable is equal to the value of the slider, height is equal to the value of the height slider, and then height * height as you need to square the bottom number (bmi formula look it up if confused) also brackets are essential so height x height is done first before divided //
        
        
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // this code is difficult to explain, but the segue is the linking between the 2 screens, it is done in the main storyboard from the 2 calcuate View Controllers, the video for the code below is video 126 section11 //
        if segue.identifier == "goToResult" {
            // as! is used to show swift that we want the bmiValue to be/come from the ResultViewController file, if you remove the as! ResultViewController swift will assume the bmi value is from the UIViewController when it doesnt, it is declared in the resultViewController, see video 126 if it doesnt make sense //
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

