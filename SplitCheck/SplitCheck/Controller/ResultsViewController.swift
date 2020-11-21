//
//  ResultsViewController.swift
//  SplitCheck
//
//  Created by Mahoto Sasaki on 6/6/20.
//  Copyright © 2020 mo3aru. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var total:String?
    var splitNumber:Int?
    var tipPercent:Int?

    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var splitCharacteristicsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalAmountLabel.text = total
        splitCharacteristicsLabel.text = "Split between \(splitNumber ?? 0) people with \(tipPercent ?? 0)% tip"
    }
    
 
    @IBAction func recalculatedButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
