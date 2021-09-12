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
    var isFinishedTypingNumber = true
//    var currentInput: String = "" {
//        didSet {
//            displayLabel.text = currentInput
//        }
//    }
//
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
//        currentInput = ""
        isFinishedTypingNumber = true
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numVal = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            } else {
                displayLabel.text! += numVal
            }
//            currentInput += numVal
        }
        
    }

}

