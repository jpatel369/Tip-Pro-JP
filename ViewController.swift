//
//  ViewController.swift
//  TipPro
//
//  Created by Jay Patel on 6/20/17.
//  Copyright © 2017 Jay Patel Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var TipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!

    @IBAction func calculateTip(_ sender: AnyObject) {
        if let billAmount = Double(billAmountField.text!) {
            var tipPrecentage = 0.0
            
            switch TipSelector.selectedSegmentIndex {
            case 0:
                tipPrecentage = 0.15
            case 1:
                tipPrecentage = 0.18
            case 2:
                tipPrecentage = 0.20
            default:
                break
            }
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPrecentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount+roundedTipAmount
            
            if (!billAmountField.isEditing) {
                billAmountField.text = String(format: "%.2f", roundedBillAmount)
            }
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
        } else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

