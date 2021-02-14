//
//  ViewController.swift
//  TokarLV_HW2.2
//
//  Created by Lyudmila Tokar on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var viewColored: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColored.layer.cornerRadius = 10
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.57
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.53
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.63
        blueSlider.minimumTrackTintColor = .blue
        
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
        
        viewColored.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }

    @IBAction public func redSliderAction(_ sender: UISlider) {
        redLabel.text = roundingValuesForText(sender.value)
        redTextField.text = roundingValuesForText(sender.value)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(sender.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenLabel.text = roundingValuesForText(sender.value)
        greenTextField.text = roundingValuesForText(sender.value)
   
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(sender.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueLabel.text = roundingValuesForText(sender.value)
        blueTextField.text = roundingValuesForText(sender.value)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(sender.value), alpha: 1)
    }
    //MARK: Rounding
    private func roundingValuesForText (_ value: Float) -> String {
        return String(round(value * 100) / 100)
    }
}

