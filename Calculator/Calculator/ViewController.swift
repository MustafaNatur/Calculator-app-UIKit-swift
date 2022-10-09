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
        case equally = "="
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
        resetAll()
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
        witchOperation(.devision)
    }
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        witchOperation(.multiply)
    }
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        witchOperation(.minus)
    }
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        witchOperation(.plus)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        secondNumber = currentNumber
        result = calculate(operation)
        outPutLabel.text = result
        resetAll()
    }
    
    func calculate(_ operation: Operations) -> String {
        if let f = Double(firstNumber) , let s = Double(secondNumber)  {
            if (operation == .plus) {
                result = "\(f + s)"
            } else if (operation == .minus) {
                result = "\(f - s)"
            } else if (operation == .devision) {
                result = "\(f/s)"
            } else if (operation == .multiply) {
                result = "\(f*s)"
            }
        }
        return result
    }
    
    func resetAll() {
        currentNumber = ""
        firstNumber = ""
        secondNumber = ""
        operation = .NULL
        result = ""
    }
    
    func witchOperation(_ operationNew: Operations) {
        if (!currentNumber.isEmpty || !firstNumber.isEmpty) {
            if (operation == .NULL) {
                firstNumber = currentNumber
                currentNumber = ""
            }
            operation = operationNew
        }
    }
}

