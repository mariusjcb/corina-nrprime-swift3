//
//  PrimeNumber.swift
//  prime3
//
//  Created by Marius Ilie on 30/01/17.
//  Copyright © 2017 University of Bucharest - Marius Ilie. All rights reserved.
//

import Foundation

final class PrimeNumber {
    var onPrimalityChanges: (()->())?
    
    var value: Int? {
        didSet {
            if value != nil {
                primality = check(prime: value)
            } else {
                primality = nil
            }
        }
    }
    
    var primality: Bool?{
        didSet {
            if let closure = onPrimalityChanges {
                closure()
            }
        }
    }
    
    convenience init(onPrimalityChanges: (()->())?) {
        self.init()
        if let closure = onPrimalityChanges {
            self.onPrimalityChanges = closure
        }
    }
    
    private func check(prime number: Int!) -> Bool {
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
}
