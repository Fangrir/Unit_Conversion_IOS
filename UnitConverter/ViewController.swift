//
//  ViewController.swift
//  UnitConverter
//
//  Created by Kenny Evan on 3/16/18.
//  Copyright © 2018 Kenny Evan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var userInputNumber: UITextField!
    @IBOutlet weak var userInputMeasurement: UITextField!
    @IBOutlet weak var userOuputMeasurement: UITextField!
    @IBOutlet weak var convertedMeasurement: UILabel!
    
    var pickerData : [String] = ["inch", "feet", "yard", "centimeter", "meter"]
    
    var constantMultipliyer : Double = 0
    
    var userInputUnit : String = ""
    
    var userOutputUnit : String = ""
    
    var convertedResult : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let picker = UIPickerView()
        let picker2 = UIPickerView()
        
        convertedMeasurement.text = ""
        
        picker.tag = 1
        picker2.tag = 2
        
        userInputMeasurement.inputView = picker
        userOuputMeasurement.inputView = picker2
        
        picker.delegate = self
        picker.dataSource = self
        
        picker2.delegate = self
        picker2.delegate = self
        
        userInputMeasurement.placeholder = "Please choose a measurement unit"
        userOuputMeasurement.placeholder = "Please choose a measurement unit"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            userInputMeasurement.text = pickerData[row]
        }
        else if pickerView.tag == 2 {
            userOuputMeasurement.text = pickerData[row]
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        userOutputUnit = userOuputMeasurement.text!
        userInputUnit = userInputMeasurement.text!

        if CheckMultipliyer(userInput: userInputUnit, userOutput: userOutputUnit) == 0 {
            
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Please check your convertion unit.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            convertedResult = CheckMultipliyer(userInput: userInputUnit, userOutput: userOutputUnit) * Double(userInputNumber.text!)!
        }
        
        convertedMeasurement.text = String(convertedResult)
    }
    
    func CheckMultipliyer (userInput : String, userOutput : String) -> Double {
        
        if userInput == "inch" && userOutput == "inch"
        {
            constantMultipliyer = 1
        }
        else if userInput == "inch" && userOutput == "feet" {
            constantMultipliyer = 0.0833333
        }
        else if userInput == "inch" && userOutput == "yard" {
            constantMultipliyer = 0.0277778
        }
        else if userInput == "inch" && userOutput == "centimeter" {
            constantMultipliyer = 2.54
        }
        else if userInput == "inch" && userOutput == "meter" {
            constantMultipliyer = 0.0254
        }
        else if userInput == "feet" && userOutput == "feet" {
            constantMultipliyer = 1
        }
        else if userInput == "feet" && userOutput == "inch" {
            constantMultipliyer = 12
        }
        else if userInput == "feet" && userOutput == "yard" {
            constantMultipliyer = 0.333333
        }
        else if userInput == "feet" && userOutput == "centimeter" {
            constantMultipliyer = 30.48
        }
        else if userInput == "feet" && userOutput == "meters" {
            constantMultipliyer = 0.3048
        }
        else if userInput == "yard" && userOutput == "yard" {
            constantMultipliyer = 1
        }
        else if userInput == "yard" && userOutput == "inch" {
            constantMultipliyer = 36
        }
        else if userInput == "yard" && userOutput == "feet" {
            constantMultipliyer = 3
        }
        else if userInput == "yard" && userOutput == "centimeter" {
            constantMultipliyer = 91.44
        }
        else if userInput == "yard" && userOutput == "meter" {
            constantMultipliyer = 0.9144
        }
        else if userInput == "centimeter" && userOutput == "centimeter" {
            constantMultipliyer = 1
        }
        else if userInput == "centimeter" && userOutput == "inch" {
            constantMultipliyer = 0.393701
        }
        else if userInput == "centimeter" && userOutput == "feet" {
            constantMultipliyer = 0.0328084
        }
        else if userInput == "centimeter" && userOutput == "yard" {
            constantMultipliyer = 0.0109361
        }
        else if userInput == "centimeter" && userOutput == "meter" {
            constantMultipliyer = 0.01
        }
        else if userInput == "meter" && userOutput == "meter" {
            constantMultipliyer = 1
        }
        else if userInput == "meter" && userOutput == "inch" {
            constantMultipliyer = 39.3701
        }
        else if userInput == "meter" && userOutput == "feet" {
            constantMultipliyer = 3.28084
        }
        else if userInput == "meter" && userOutput == "yard" {
            constantMultipliyer = 1.09361
        }
        else if userInput == "meter" && userOutput == "centimeter" {
            constantMultipliyer = 100
        }
        else {
            constantMultipliyer = 0
        }
        
        return constantMultipliyer

    }
    
}

