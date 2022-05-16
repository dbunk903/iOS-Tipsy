//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender == tenPctButton{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if sender == twentyPctButton{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
}

