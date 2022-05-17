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
    var tipAmount:Double = 0.0
    var numberOfPeople = 2
    var billAmount: Double = 0.0
    var res = "0.0"
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.0
        } else if sender == tenPctButton{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipAmount = 0.1
        } else if sender == twentyPctButton{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipAmount = 0.2
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // splitNumberLabel.text = String(Int(sender.value))
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Double(billTextField.text!) ?? 0.0
        let calculatedAmount = (((billAmount * (1 + tipAmount)) / Double(numberOfPeople)) * 100).rounded() / 100
        res = String(format: "%.2f", calculatedAmount)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.res = res
            destinationVC.numOfPeople = numberOfPeople
            destinationVC.tipAmount = tipAmount
        }
    }
}

