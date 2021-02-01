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
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var viewColored: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColored.layer.cornerRadius = 30
        viewColored.backgroundColor = .black
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0
        blueSlider.minimumTrackTintColor = .blue
        
        redLabel.text = String(round(redSlider.value * 100) / 100)
        greenLabel.text = String(round(greenSlider.value * 100) / 100)
        blueLabel.text = String(round(greenSlider.value * 100) / 100)
        
    }

    @IBAction public func redSliderAction(_ sender: UISlider) {
        let redValue: Float = sender.value
        redLabel.text = String(redValue)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redValue), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenLabel.text = String(sender.value)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(sender.value), blue: 0, alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueLabel.text = String(sender.value)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(sender.value), alpha: 1)
    }
    
}
