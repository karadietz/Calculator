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
//make button to toggle between decimal or fraction notation
//ensure it goes number -> operation-> number...
//make disabled buttons different colour

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clearButton: UIButton!
    
    
    var numbersPressed = [Double]()
    var operationsPressed = [String]()
    var shouldClear = false
    var isAllClear = true
    var clearPressedOnce = false
    var justCalculated = false
    
    func storeNumber(){
        if let text:Double = Double(numTextField.text!){
            numbersPressed.append(text)
        }
    }

    func storeOperation(op: String){
        operationsPressed.append(op)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        plusButton?.isEnabled = true
//        subButton?.isEnabled = true
//        multButton?.isEnabled = true
//        divButton?.isEnabled = true
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    
    @IBOutlet weak var CalcLabel: UILabel!
    @IBOutlet weak var numTextField: UITextField!

    func setButtons(enable: Bool = true){
        plusButton?.isEnabled = enable
        subButton?.isEnabled = enable
        multButton?.isEnabled = enable
        divButton?.isEnabled = enable
//        if enable {
//            plusButton?.isEnabled = true
//            subButton?.isEnabled = true
//            multButton?.isEnabled = true
//            divButton?.isEnabled = true
//        } else {
//            plusButton?.isEnabled = false
//            subButton?.isEnabled = false
//            multButton?.isEnabled = false
//            divButton?.isEnabled = false
//        }

    }
    
    func setClearText(doAllClear: Bool){
        if doAllClear {
            clearButton.setTitle("ALL CLEAR", for: .normal)
            clearButton.titleLabel?.font = UIFont(name: "System Thin", size: 22)
        }
        else {
            clearButton.setTitle("CLEAR", for: .normal)
            clearButton.titleLabel?.font = UIFont(name: "System Thin", size: 37)
            
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        numTextField.text = ""
        if clearButton.titleLabel!.text == "ALL CLEAR" {
            numbersPressed = []
            operationsPressed = []
        }
        else {
            setClearText(doAllClear: true)
        }
        setButtons()
//        plusButton?.isEnabled = true
//        subButton?.isEnabled = true
//        multButton?.isEnabled = true
//        divButton?.isEnabled = true
    }
    
    func numButtonPressed(num: String) {
        if justCalculated {
            numbersPressed = []
            operationsPressed = []
        }
        if (shouldClear){
            numTextField.text = ""
            shouldClear = false
        }
        let text = numTextField.text
        numTextField.text = text! + num
       // isAllClear = false
        clearPressedOnce = false
        setClearText(doAllClear: clearPressedOnce)
        justCalculated = false
        
//        plusButton.isEnabled = true
        //        subButton.isEnabled = true
        //        multButton.isEnabled = true
        //        divButton.isEnabled = true
        
        setButtons()
//        plusButton?.isEnabled = true
//        subButton?.isEnabled = true
//        multButton?.isEnabled = true
//        divButton?.isEnabled = true
        
    }
    
    func addSubNumbers() {
        var ans = numbersPressed[0]
        var i = 0
        for op in operationsPressed {
            if op == "plus" {
                ans += numbersPressed[i+1]
            }
            else if op == "subtract" {
                ans -= numbersPressed[i+1]
            }
            i += 1
        }
        
        //removes decimal place for integers
        let integerNum = Int(ans)
        if (ans - Double(integerNum) == 0.0){
            numTextField.text = String(integerNum)
        }
        else {
            numTextField.text = String(ans)
        }
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        storeNumber()
        //numTextField.text = "answer"
        print(numbersPressed)
        print(operationsPressed)
        shouldClear = true
        justCalculated = true
        
        if (operationsPressed == [] || numbersPressed == []) {
            //do nothing (don't change the textfield)
            print("an array is empty")
        }
            
        else if (!operationsPressed.contains("multiply") && !operationsPressed.contains("divide")){
            //add and subtract the numbers in numbersPressed
            //let len = operationsPressed.count
            addSubNumbers()
        }
        else {
            //look for multiplication/division, perform those operations first
            var i = 0
            //var ops = [Int]()
            for item in operationsPressed {
                var temp = 0.0
                var flag = false
                if (item == "multiply") {
                    temp = numbersPressed[i] * numbersPressed[i+1]
                    flag = true
                }
                else if (item == "divide") {
                    temp = numbersPressed[i]/numbersPressed[i+1]
                    print(temp)
                    //watch for errors here
                    flag = true
                }
                if flag {
                    numbersPressed[i] = temp
                    numbersPressed.remove(at: i+1)
                    operationsPressed.remove(at: i)
                    i-=1
                }
                i+=1
            }
            
            print(operationsPressed)
            addSubNumbers()
            
            
        }
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
        if justCalculated {
            numbersPressed = []
            operationsPressed = []
        }
        storeOperation(op: "plus")
        storeNumber()
        shouldClear = true
        justCalculated = false
        
        setButtons(enable: false)
        plusButton?.isEnabled = true
        //pressing it twice will unclick it
//        subButton?.isEnabled = false
//        multButton?.isEnabled = false
//        divButton?.isEnabled = false
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        if justCalculated {
            numbersPressed = []
            operationsPressed = []
        }
        storeOperation(op: "subtract")
        storeNumber()
        shouldClear = true
        justCalculated = false
        
        setButtons(enable: false)
        subButton?.isEnabled = true
//        plusButton?.isEnabled = false
//        multButton?.isEnabled = false
//        divButton?.isEnabled = false
    }
    
    @IBAction func multButton(_ sender: UIButton) {
        if justCalculated {
            numbersPressed = []
            operationsPressed = []
        }
        storeOperation(op: "multiply")
        storeNumber()
        shouldClear = true
        justCalculated = false
        
        setButtons(enable: false)
        multButton?.isEnabled = true
//        plusButton?.isEnabled = false
//        subButton?.isEnabled = false
//        divButton?.isEnabled = false
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        if justCalculated {
            numbersPressed = []
            operationsPressed = []
        }
        storeOperation(op: "divide")
        storeNumber()
        shouldClear = true
        justCalculated = false
        
        setButtons(enable: false)
        divButton?.isEnabled = true
//        plusButton?.isEnabled = false
//        subButton?.isEnabled = false
//        multButton?.isEnabled = false
   }
}

