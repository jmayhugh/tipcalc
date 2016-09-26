//
//  ViewController.swift
//  Tip Calc
//
//  Created by Julia Mayhugh on 9/24/16.
//  Copyright © 2016 Julia Mayhugh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partiesControl: UISegmentedControl!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear.")
        
        let defaults = UserDefaults.standard
        defaults.synchronize()
        let defaultTip = defaults.integer(forKey: "defaultTip")
        if defaultTip != 0 {
            tipControl.selectedSegmentIndex = defaultTip
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true)
        
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipRates = [0.15, 0.2, 0.25]
        let parties = [1.0, 2.0, 3.0]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipRates[tipControl.selectedSegmentIndex] / parties[partiesControl.selectedSegmentIndex]
        let totalTip = tip * parties[partiesControl.selectedSegmentIndex]
        let total = bill + totalTip
            
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

