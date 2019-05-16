//
//  ViewController.swift
//  CalculatorApplication
//
//  Created by Pankaj kumar on 02/05/19.
//  Copyright © 2019 Pankaj kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet weak private var inputLabel: UILabel!
    @IBOutlet private var stackView: [UIStackView]!
    
    private var firstNumber = Double()
    private var operationTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNumber = 0.0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in buttons {
            button.layer.cornerRadius = button.frame.size.width / 2.0
            button.clipsToBounds = true
            if button.titleLabel?.text == "." {
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
            } else if button.titleLabel?.text == "*" {
                button.titleEdgeInsets = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
            }
            for stacks in stackView {
                stacks.layoutSubviews()
            }
        }
    }
    
    @IBAction private func numericTask(_ numericButton: UIButton) {
        let numberTitle = numericButton.currentTitle!
        inputLabel.text = inputLabel.text! + numberTitle
    }
    
    @IBAction private func operationTask(_ operationButton: UIButton) {
        operationTitle = operationButton.currentTitle!
        let currentinput = inputLabel.text!
        if currentinput.count > 0 && currentinput != "." {
            firstNumber = Double(currentinput)!
        }
        inputLabel.text = ""
    }
    
    @IBAction private func calculationTask(_ equalsButton: UIButton) {
        let currentinput = inputLabel.text!
        guard let secondNumber = Double(currentinput) else { return }
        guard let finalValue = calculateOutput(first: firstNumber, second: secondNumber, operation: operationTitle) else {
            return
        }
        let output = Double(round(100*finalValue)/100) // rounding off
        inputLabel.text = String(output)
    }
    
    @IBAction private func clearingTask(_ clearButton: UIButton) {
        inputLabel.text = ""
        firstNumber = 0
    }
    
    private func calculateOutput(first: Double, second: Double, operation: String) -> Double? {
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
