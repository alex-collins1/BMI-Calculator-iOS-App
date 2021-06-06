//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Alex Collins on 04/06/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit



class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this will show the bmi based on the user slider data and will show when screen loads  //
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        // that will chnage the background color from the default color made in main.storyboard to the new color which is found in the color variable //
    
    
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // when the button is pressed the second screen will be removed off screen and the first screen will be showed again //
        
        dismiss(animated: true, completion: nil)
    }
    
}
