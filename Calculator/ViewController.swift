//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - DATA
    private var calculatorLogic = CalculatorLogic()
    private var isFinishedTypingNumber = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true

        calculatorLogic.setNumber(displayValue)
        
        guard let calcMethod = sender.currentTitle else { return }

        if let result = calculatorLogic.calculate(symbol: calcMethod) {
            displayValue = result
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let numVal = sender.currentTitle else { return }
        
        if isFinishedTypingNumber {
            displayLabel.text = numVal == "." ? "0." : numVal
            isFinishedTypingNumber = false
        } else {
            guard numVal != "." || !displayLabel.text!.contains(".")  else {
                return
            }
            displayLabel.text! += numVal
        }
    }
}

