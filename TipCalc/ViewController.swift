//
//  ViewController.swift
//  TipCalc
//
//  Created by Karamel, Raghu on 3/12/17.
//  Copyright © 2017 Karamel, Raghu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var tipCalcView: UIView!

    @IBOutlet weak var tipControl2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.3]
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl2.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func changeTip(_ sender: Any) {
        calculateTip(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaults=UserDefaults.standard
        tipControl2.selectedSegmentIndex=defaults.integer(forKey: "defaultTipIndex")
        calculateTip(self)
        
        tipCalcView.alpha = 0
        UIView.animate(withDuration: 5, animations: {
            self.tipCalcView.alpha=1
        })
        
        billField.becomeFirstResponder()
   }
    
}

