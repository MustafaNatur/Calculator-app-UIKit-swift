//
//  ViewController.swift
//  Calculator
//
//  Created by Мустафа Натур on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outPutLabel: UILabel!
    
    enum Operations:String {
        case plus = "+"
        case minus = "-"
        case devision = "/"
        case multiply = "X"
        case NULL = "NULL"
    }

    var currentNumber:String = ""
    var firstNumber:String = ""
    var secondNumber:String = ""
    var operation:Operations = .NULL
    var result:String = ""
    var maxNumberCount = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPutLabel.text = "0"
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if (currentNumber.count < maxNumberCount) {
            currentNumber+="\(sender.tag)"
            outPutLabel.text = currentNumber
        }
    }
    
    @IBAction func dotbuttonPressed(_ sender: UIButton) {
        if !currentNumber.contains(".") && !currentNumber.isEmpty {
            currentNumber+="."
            outPutLabel.text = currentNumber
        }
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        currentNumber = ""
        firstNumber = ""
        secondNumber = ""
        operation = .NULL
        result = ""
        outPutLabel.text = currentNumber
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        guard !currentNumber.isEmpty else {
            return
        }
        currentNumber.removeLast()
        outPutLabel.text = currentNumber
    }
    @IBAction func devisionButtonPressed(_ sender: UIButton) {
    }
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
    }
    @IBAction func minusButtonPressed(_ sender: UIButton) {
    }
    @IBAction func plusButtonPressed(_ sender: UIButton) {
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
    }
    
    func witchOperation(_ operation: Operation) {
        
    }
}

