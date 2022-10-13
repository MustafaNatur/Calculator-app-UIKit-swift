//
//  ViewController.swift
//  Calculator
//
//  Created by Мустафа Натур on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var outPutLabel: UILabel!
    var color:UIColor = UIColor(red: 153/255, green: 128/255, blue: 255/255, alpha: 1)
    enum Operations:String {
        case plus = "+"
        case minus = "-"
        case devision = "/"
        case multiply = "X"
        case NULL = "NULL"
        case equally = "="
    }
    
    @IBAction func ToFirstViewController(_ segue: UIStoryboardSegue) {
        guard let sourceVC = segue.source as? SecondViewController else {
            return
        }
        color = sourceVC.color
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
        colorButton.backgroundColor = color
        result = "0"
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if (currentNumber.count <= maxNumberCount) {
            currentNumber+="\(sender.tag)"
            outPutLabel.text = currentNumber
        }
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        if let number = Int(currentNumber) {
            if (number != 0) {
                currentNumber+="\(sender.tag)"
                outPutLabel.text = currentNumber
            }
        } else {
            currentNumber = "0"
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
        result = calculate(operation)
        let clearResult = cleanResult(result)
        outPutLabel.text = clearResult
        operation = .NULL
        currentNumber = result
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
        if let number = Int(currentNumber) {
            currentNumber = String(number * -1)
        }
        outPutLabel.text = currentNumber
    }
    
    func calculate(_ operation: Operations) -> String {
        secondNumber = currentNumber
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
    
    func cleanResult(_ result:String) -> String {
        var newResult = result
        if (result[result.index(before: result.endIndex)] == "0") {
            let index = result.firstIndex(of:".") ?? result.endIndex
            newResult = String(result[..<index])
        }
        
        if (result.count > 9) {
            let miss = result.count - 9
            let index = result.index(result.startIndex, offsetBy: 9)
            newResult = String(result[..<index]) + "E\(miss)"
        }
        
        return newResult
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondScreen" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.color = color
            }
        }
    }
}

