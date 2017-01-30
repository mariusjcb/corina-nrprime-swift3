//
//  IntentViewController.swift
//  PrimeNumberSiriIntentUI
//
//  Created by Marius Ilie on 30/01/17.
//  Copyright © 2017 University of Bucharest - Marius Ilie. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling, INUIHostedViewSiriProviding {
    var number: PrimeNumber?
    
    var displaysMessage: Bool {
        return true
    }
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        if let sendMessageIntent = interaction.intent as? INSendMessageIntent {
            number = PrimeNumber(onPrimalityChanges: { [weak weakSelf = self] in
                weakSelf?.updateUI()
            })
            
            number?.value = Int((sendMessageIntent.recipients?[0].personHandle?.value)!)
        }
        
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
    func updateUI() {
        if let currentStatus = number?.primality {
            numberLabel.text = "Numarul \((number?.value)!) este"
            
            if currentStatus {
                statusLabel.text = "PRIM"
                self.view.backgroundColor = UIColor.green
            } else {
                statusLabel.text = "NEPRIM"
                self.view.backgroundColor = UIColor.red
            }
        } else {
            statusLabel.text = "NU E NUMAR"
            self.view.backgroundColor = UIColor.white
        }
    }
    
}
