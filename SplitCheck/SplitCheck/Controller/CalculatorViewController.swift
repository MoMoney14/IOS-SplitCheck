//
//  ViewController.swift
//  SplitCheck
//
//  Created by Mahoto Sasaki on 6/6/20.
//  Copyright © 2020 mo3aru. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var billBrain = BillBrain()
    var tipPercent:Float = 0
    
    @IBAction func tipButtonClicked(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        if(sender.currentTitle == "0%"){
            tipPercent = 0
        } else if (sender.currentTitle == "10%"){
            tipPercent = 0.1
        } else {
            tipPercent = 0.2
        }
        sender.isSelected = true
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonClicked(_ sender: UIButton) {
        billTextField.endEditing(true)
        let amount = Float(billTextField.text ?? "0") ?? 0
        let splitNumber = Int(splitNumberLabel.text ?? "0") ?? 0
        billBrain.calculateBill(amount: amount, tipPercent: tipPercent, splitNumber: splitNumber)
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResults"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = billBrain.getBill()
            destinationVC.splitNumber = billBrain.getSplitNum()
            destinationVC.tipPercent = billBrain.getTipInt()
        }
    }
    
}

