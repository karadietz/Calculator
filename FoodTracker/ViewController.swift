//
//  ViewController.swift
//  FoodTracker
//
//  Created by Kara Dietz on 2019-06-17.
//  Copyright © 2019 Kara Dietz. All rights reserved.
//


//NOTES:
//when the number buttons are pressed, I think I will want to check whether an operation button was pressed just before it (if so, then the textfield should be cleared first
//after calculate has been pressed a number appears, if they start pressing new numbers, the answer goes away

import UIKit

class ViewController: UIViewController {
    var numbersPressed = [Int]()
    var operationsPressed = [String]()
    
    func storeNumber(num: Int){
        numbersPressed.append(num)
    }
    
    func storeOperation(op: String){
        operationsPressed.append(op)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBOutlet weak var CalcLabel: UILabel!
    
    @IBOutlet weak var numTextField: UITextField!
    
    @IBAction func clearButton(_ sender: UIButton) {
        numTextField.text = ""
    }
    
    func numButtonPressed(num: String) {
        let text = numTextField.text
        numTextField.text = text! + num
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        numTextField.text = "answer"
        print(numbersPressed)
        print(operationsPressed)
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        numButtonPressed(num: "1")
        storeNumber(num: 1)
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        numButtonPressed(num: "2")
        storeNumber(num: 2)
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        numButtonPressed(num: "3")
        storeNumber(num: 3)
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        numButtonPressed(num: "4")
        storeNumber(num: 4)
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        numButtonPressed(num: "5")
        storeNumber(num: 5)
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        numButtonPressed(num: "6")
        storeNumber(num: 6)
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        numButtonPressed(num: "7")
        storeNumber(num: 7)
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        numButtonPressed(num: "8")
        storeNumber(num: 8)
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        numButtonPressed(num: "9")
        storeNumber(num: 9)
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        numButtonPressed(num: "0")
        storeNumber(num: 0)
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        storeOperation(op: "plus")
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        storeOperation(op: "subtract")
    }
    
    @IBAction func multButton(_ sender: UIButton) {
        storeOperation(op: "multiply")
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        storeOperation(op: "divide")
    }
}

