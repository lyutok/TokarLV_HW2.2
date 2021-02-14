//
//  ViewController.swift
//  TokarLV_HW2.2
//
//  Created by Lyudmila Tokar on 2/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate!

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
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.6
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
        redTextField.delegate = self
        greenTextField.text = String(greenSlider.value)
        greenTextField.delegate = self
        blueTextField.text = String(blueSlider.value)
        blueTextField.delegate = self
        
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
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate.setNewBackgroundColor(for: UIColor(red: CGFloat(redSlider.value),
                                                    green: CGFloat(greenSlider.value),
                                                    blue: CGFloat(blueSlider.value), alpha: 1))
        dismiss(animated: true)
    }
    
    //MARK: Rounding
    private func roundingValuesForText (_ value: Float) -> String {
        return String(round(value * 100) / 100)
    }
    
    //MARK: Alerts
        private func showAlert()
        {
            let alertController = UIAlertController(title: "Wrong data!",
                                                    message: "Please, use a number from 0 to 1.",
                                                    preferredStyle: .alert)
            let alertOkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertOkAction)
            
            present(alertController, animated: true)
        }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue), numberValue <= 1 else {
            showAlert()
            textField.text = ""
            return
        }
        if textField == redTextField {
            redSlider.value = numberValue
            redLabel.text = roundingValuesForText(numberValue)
            
            viewColored.backgroundColor = UIColor (red: CGFloat(numberValue), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            
        } else if textField == greenTextField {
            greenSlider.value = numberValue
            greenLabel.text = roundingValuesForText(numberValue)
            
            viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(numberValue), blue: CGFloat(blueSlider.value), alpha: 1)
            
        } else {
            blueSlider.value = numberValue
            blueLabel.text = roundingValuesForText(numberValue)
            
            viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(numberValue), alpha: 1)
    }
        
     //   UIBarButtonItem(
      //  self.navigationItem.backBarButtonItem = doneButton();
        
    
}
    //Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
}
