//
//  ConversionViewController.swift
//  SimpleApp
//
//  Created by Mark Nazzaro on 10/29/18.
//  Copyright © 2018 King Ultimat0's Fabulous Creations. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var fahrenheitLabel: UILabel!
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var kelvinLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        celsiusValue = Measurement(value: Double(slider!.value), unit: .celsius)

        updateKelvinValue()
        updateFahrenheitValue()
        updateCelsiusValue()
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        didSet {
            updateKelvinValue()
            updateFahrenheitValue()
            updateCelsiusValue()
        }
    }
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        if let celsiusValue = celsiusValue {
            return celsiusValue.converted(to: .fahrenheit)
        }
        else {
            return nil
        }
    }
    
    var kelvinValue: Measurement<UnitTemperature>? {
        if let celsiusValue = celsiusValue {
            return celsiusValue.converted(to: .kelvin)
        }
        else {
            return nil
        }
    }
    
    @IBAction func sliderValueChanged (_ sender: Any) {
        celsiusValue = Measurement(value: Double(slider!.value), unit: .celsius)
    }
    
    func updateFahrenheitValue() {
        if let fahrenheitValue = fahrenheitValue {
            fahrenheitLabel.text = "Fahrenheit: " +
                numberFormatter.string(from: NSNumber(value: fahrenheitValue.value))!        }
        else {
            fahrenheitLabel.text = "Fahrenheit: ???"
        }
    }
    
    func updateKelvinValue() {
        if let kelvinValue = kelvinValue {
            kelvinLabel.text = "Kelvin: " +
                numberFormatter.string(from: NSNumber(value: kelvinValue.value))!
        }
        else {
            kelvinLabel.text = "Kelvin: ???"
        }
    }
    
    func updateCelsiusValue() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "Celsius: " +
                numberFormatter.string(from: NSNumber(value: celsiusValue.value))!
        }
        else {
            celsiusLabel.text = "Celsius: ???"
        }
    }
}
