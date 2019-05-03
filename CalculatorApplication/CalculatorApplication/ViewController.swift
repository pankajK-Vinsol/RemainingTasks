//
//  ViewController.swift
//  CalculatorApplication
//
//  Created by Pankaj kumar on 02/05/19.
//  Copyright © 2019 Pankaj kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var inputLabel: UILabel!
    
    var firstNumber: Double = 0
    var operationTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in Buttons {
            button.layer.cornerRadius = button.frame.size.width / 2.0
            button.clipsToBounds = true
        }
    }
    
    @IBAction func numericTask(_ numericButton: UIButton) {
        let numberTitle = numericButton.currentTitle!
        inputLabel.text = inputLabel.text! + numberTitle
    }
    
    @IBAction func operationTask(_ operationButton: UIButton) {
        operationTitle = operationButton.currentTitle!
        let currentinput = inputLabel.text!
        if currentinput.count > 0 {
            firstNumber = Double(currentinput)!
        }
        inputLabel.text = ""
    }
    
    @IBAction func calculationTask(_ equalsButton: UIButton) {
        let currentinput = inputLabel.text!
        let secondNumber = Double(currentinput)!
        guard let finalValue = calculateOutput(first: firstNumber, second: secondNumber, operation: operationTitle) else {
            return
        }
        let output = Double(round(100*finalValue)/100) // rounding off
        inputLabel.text = String(output)
    }
    
    @IBAction func clearingTask(_ clearButton: UIButton) {
        inputLabel.text = ""
        firstNumber = 0
    }
    
    func calculateOutput (first: Double, second: Double, operation: String) -> Double? {
        switch operation {
        case "+":
            return first + second
        case "-":
            return first - second
        case "*":
            return first * second
        case "/":
            if second == 0 {
                return nil
            }
            return first / second
        default:
            return nil
        }
    }
}
