//
//  ViewController.swift
//  prime3
//
//  Created by Marius Ilie on 17/01/17.
//  Copyright © 2017 University of Bucharest - Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number: PrimeNumber?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func onTap(_ sender: UIButton) {
        textField.resignFirstResponder()
        setNumber(fromString: textField.text)
    }
    
    @IBAction func checkButtonTitle(_ sender: UIButton) {
        setNumber(fromString: sender.currentTitle)
    }
    
    @IBAction func textFieldContentChanged(_ sender: UITextField) {
        setNumber(fromString: textField.text)
    }
    
    func setNumber(fromString string: String?) {
        if let content = string {
            number?.value = Int(content)
        }
    }
    
    override func viewDidLoad() {
        number = PrimeNumber(onPrimalityChanges: { [weak weakSelf = self] in
            weakSelf?.updateUI()
        })
    }
    
    // MARK: - UI
    
    func updateUI() {
        if let currentStatus = number?.primality {
            textField.text = String(describing: (number?.value)!)
            
            if currentStatus {
                statusLabel.text = "PRIM"
                self.view.backgroundColor = UIColor.green
            } else {
                statusLabel.text = "NEPRIM"
                self.view.backgroundColor = UIColor.red
            }
        } else {
            textField.text = ""
            statusLabel.text = "NU E NUMAR"
            self.view.backgroundColor = UIColor.white
        }
    }
}

