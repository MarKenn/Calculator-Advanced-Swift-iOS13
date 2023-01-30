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

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    func calculate(symbol: String) -> Double? {
        guard let number else { return nil }

        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number / 100
        }
        return nil
    }
}
