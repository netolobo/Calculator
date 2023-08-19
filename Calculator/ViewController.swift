//
//  ViewController.swift
//  Calculator
//
//  Created by Neto Lobo on 10/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        switch sender.tag {
        case zero:
            Calc.setScreenNumber(number: "\(zero)")
            break
        case one:
            Calc.setScreenNumber(number: "\(one)")
            break
        case two:
            Calc.setScreenNumber(number: "\(two)")
            break
        case three:
            Calc.setScreenNumber(number: "\(three)")
            break
        case four:
            Calc.setScreenNumber(number: "\(four)")
            break
        case five:
            Calc.setScreenNumber(number: "\(five)")
            break
        case six:
            Calc.setScreenNumber(number: "\(six)")
            break
        case seven:
            Calc.setScreenNumber(number: "\(seven)")
            break
        case eight:
            Calc.setScreenNumber(number: "\(eight)")
            break
        case nine:
            Calc.setScreenNumber(number: "\(nine)")
            break
        case point:
            Calc.point()
            break
        case equal:
            Calc.equals()
            break
        case add:
            Calc.basicOperation(.add)
            break
        case subtract:
            Calc.basicOperation(.subtract)
            break
        case multiply:
            Calc.basicOperation(.multiply)
            break
        case divide:
            Calc.basicOperation(.divide)
            break
        case percentage:
            Calc.percentage()
            break
        case positiveNegative:
            Calc.negativePositive()
            break
        default:
            Calc.aC()
            break
        }
        updateScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateScreen() {
        display.text = Calc.getDisplay()
    }
}

