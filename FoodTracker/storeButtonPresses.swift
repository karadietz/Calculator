//
//  storeButtonPresses.swift
//  Calculator
//
//  Created by Kara Dietz on 2019-07-13.
//  Copyright © 2019 Kara Dietz. All rights reserved.
//

import Foundation

class StoreButtonPresses:ViewController {
    var numbersPressed = [Int]()
    var operationsPressed = [String]()
    
    func storeNumber(num: Int){
        numbersPressed.append(num)
    }
    
    func storeOperation(op: String){
        operationsPressed.append(op)
    }
}
