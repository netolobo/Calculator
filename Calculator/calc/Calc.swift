//
//  Calc.swift
//  Calculator
//
//  Created by Neto Lobo on 15/08/23.
//

final class Calc {
    private static var currentNumber: Double = 0
    private static var previousNumber: Double = 0
    private static var display: String = zed
    private static var previousOperation: Operation? = nil
    private static var currentOperation: Operation? = nil
    private static var stillTyping: Bool = true
    private static var divisionByZeroError = false
    
    static func basicOperation(_ operation: Operation) {
        if display != error {
            performOperation()
            updateCurrentOperation(operation)
            updatePreviousNumber(currentNumber)
            updateStillTyping(false)
        }
    }
    
    static private func updateStillTyping(_ answer: Bool) {
        self.stillTyping = answer
    }
    
    static private func updateCurrentOperation(_ operation: Operation) {
        self.currentOperation = operation
    }
    
    private static func updatePreviousOperation(_ operation: Operation) {
        self.previousOperation = operation
    }
    
    static private func updatePreviousNumber(_ number: Double) {
        self.previousNumber = number
    }
    
    static private func updateCurrentNumber(_ num: Double){
        self.currentNumber = num
    }
    
    static func updateDisplay(_ value: String){
        self.display = formatLargeNumber(value)
    }
    
    static func getDisplay() -> String {
        return self.display
    }
    
    static func setScreenNumber(number: String) {
        var currentDisplayNumber = number
        if display != zed && stillTyping && display != error {
            currentDisplayNumber = display+number
        }
        if isValidInput(currentDisplayNumber) {
            updateDisplay(currentDisplayNumber)
            updateCurrentNumber(Double(currentDisplayNumber)!)
            updateStillTyping(true)
        }
    }
    
    static func percentage() {
        if (currentNumber != 0) {
            updateCurrentNumber(currentNumber / 100.0)
            updateDisplay("\(currentNumber)")
        }
    }
    
    static func negativePositive() {
        var result = currentNumber
        if currentNumber < 0 {
            result =  -currentNumber
        } else if currentNumber > 0 {
            result = currentNumber - currentNumber - currentNumber
        }
        updateCurrentNumber(result)
        updateDisplay("\(result)")
    }
    
    static func point() {
        if !display.contains(dot) && display != error {
            self.display += dot
            updateStillTyping(true)
        }
        if display == error {
            self.display = zed+dot
            updateStillTyping(true)
        }
    }
    
    static func equals() {
        performOperation()
    }
    
    static func aC() {
        reset()
    }
    
    private static func reset() {
        resetCurrentNumber()
        resetCurrentOperation()
        resetDisplay()
    }
    
    private static func resetCurrentNumber() {
        self.currentNumber = 0
    }
    
    private static func resetCurrentOperation() {
        self.currentOperation = nil
        updateStillTyping(true)
    }
    
    
    
    private static func resetDisplay() {
        self.display = zed
    }
    
    private static func performOperation() {
        if currentOperation != nil {
            let tempPreviousNumber = previousNumber
            var tempCurrentNumber = currentNumber
            var tempPreviousOperation = previousOperation
            switch currentOperation {
            case .add:
                tempCurrentNumber = previousNumber+currentNumber
                tempPreviousOperation = .add
                break
            case .subtract:
                tempCurrentNumber = previousNumber-currentNumber
                tempPreviousOperation = .subtract
                break
            case .multiply:
                tempCurrentNumber = previousNumber*currentNumber
                tempPreviousOperation = .multiply
                break
            default :
                if(currentNumber == 0) {
                    divisionByZeroError = true
                }
                if(!divisionByZeroError) {
                    tempCurrentNumber = previousNumber/currentNumber
                    tempPreviousOperation = .divide
                }
                break
            }
            if(!divisionByZeroError) {
                updateCurrentNumber(tempCurrentNumber)
                updatePreviousNumber(tempPreviousNumber)
                updatePreviousOperation(tempPreviousOperation!)
                updateDisplay("\(currentNumber)")
            } else {
                display = error
                divisionByZeroError = false
            }
            resetCurrentOperation()
        }
    }
    
}
