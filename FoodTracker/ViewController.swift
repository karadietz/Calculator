//
//  ViewController.swift
//  FoodTracker
//
//  Created by Kara Dietz on 2019-06-17.
//  Copyright © 2019 Kara Dietz. All rights reserved.
//


//NOTES:
//add textfield for answer?
//after calculate has been pressed a number appears, if they start pressing new numbers, the answer goes away
//change clear button to be all clear or clear (press twice without pushing any other buttons to do all clear). All clear will clear the arrays
//change code to handle decimals (if it's repeating then show that, if it is just long then cut at 8 decimal places or something
//make button to toggle between decimal or fraction notation


import UIKit

class ViewController: UIViewController {
    var numbersPressed = [Double]()
    var operationsPressed = [String]()
    var shouldClear = false
    
    func storeNumber(){
        if let text:Double = Double(numTextField.text!){
            numbersPressed.append(text)
        }
        //let text:Double? = Double(numTextField.text!)
      //  numbersPressed.append(Double(numTextField!.text!) as! Double?)
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
        if (shouldClear){
            numTextField.text = ""
            shouldClear = false
        }
        let text = numTextField.text
        numTextField.text = text! + num
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        storeNumber()
        numTextField.text = "answer"
        print(numbersPressed)
        print(operationsPressed)
        shouldClear = true
        
        //check for multiplication/division. perform those operations on the numbers surrounding them
        //do nothing if an operation button was just pushed without a number to follow it
        //do nothing if no numbers have been entered
        //do nothing if an operation button is pushed before a number
        //numTextField.text gives an error if it's blank I think so watch out for this
        
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        numButtonPressed(num: "1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        numButtonPressed(num: "2")
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        numButtonPressed(num: "3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        numButtonPressed(num: "4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        numButtonPressed(num: "5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        numButtonPressed(num: "6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        numButtonPressed(num: "7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        numButtonPressed(num: "8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        numButtonPressed(num: "9")
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        numButtonPressed(num: "0")
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        numButtonPressed(num: ".")
    }
    @IBAction func plusButton(_ sender: UIButton) {
        storeOperation(op: "plus")
        storeNumber()
        shouldClear = true
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        storeOperation(op: "subtract")
        storeNumber()
        shouldClear = true
    }
    
    @IBAction func multButton(_ sender: UIButton) {
        storeOperation(op: "multiply")
        storeNumber()
        shouldClear = true
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        storeOperation(op: "divide")
        storeNumber()
        shouldClear = true

    }
}

