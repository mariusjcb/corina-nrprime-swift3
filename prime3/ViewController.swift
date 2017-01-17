//
//  ViewController.swift
//  prime3
//
//  Created by Marius Ilie on 17/01/17.
//  Copyright © 2017 University of Bucharest - Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Data
    
    var number: Int? {
        didSet {
            if number != nil {
                isPrime = check(prime: number)
            } else {
                isPrime = nil
            }
        }
    }

    var isPrime: Bool? {
        didSet {
            updateUI()
        }
    }
    
    
    func check(prime number: Int!) -> Bool {
        if number <= 1 {
            return false
        } else if number <= 3 {
            return true
        }
        
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    // MARK: - Controller
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func onTap(_ sender: UIButton) {
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
            number = Int(content)
        }
    }
    
    // MARK: - UI
    
    func updateUI() {
        if let currentStatus = isPrime {
            textField.text = String(describing: number!)
            
            if currentStatus {
                statusLabel.text = "Numar PRIM"
            } else {
                statusLabel.text = "Numar NEPRIM"
            }
        } else {
            textField.text = ""
            statusLabel.text = "NU E NUMAR"
        }
    }
}

