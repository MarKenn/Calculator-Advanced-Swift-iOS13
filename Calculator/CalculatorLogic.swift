//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mark Kenneth Bayona on 1/15/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {

    private var number: Double?

    private var intermediateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double? {
        guard let number else { return nil }

        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number / 100
        case "=":
            return performTwoNumCalculation(n2: number)
        default:
            intermediateCalculation = (n1: number, calcMethod: symbol)
        }
        return nil
    }

    private func performTwoNumCalculation(n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.n1,
              let operation = intermediateCalculation?.calcMethod else { return nil }

        switch operation {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            fatalError("The operation passed in does not match any of the cases")
        }
    }
}
