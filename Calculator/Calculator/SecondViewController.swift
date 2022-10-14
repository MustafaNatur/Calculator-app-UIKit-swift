//
//  SecondViewController.swift
//  Calculator
//
//  Created by Мустафа Натур on 13.10.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var redSliderValue: UISlider!
    @IBOutlet weak var greenSliderValue: UISlider!
    @IBOutlet weak var blueSliderValue: UISlider!
    var newColor = UIColor(red: 153/255, green: 128/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorButton.backgroundColor = newColor
        
    }
    
    
    @IBAction func SliderChange(_ sender: UISlider) {
        let red = CGFloat(redSliderValue.value/255)
        let green = CGFloat(greenSliderValue.value/255)
        let blue = CGFloat(blueSliderValue.value/255)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorButton.backgroundColor = color
    }
    

    


}
