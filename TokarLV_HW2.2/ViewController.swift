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
        
        viewColored.layer.cornerRadius = 10
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.63
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.33
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.63
        blueSlider.minimumTrackTintColor = .blue
        
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
        viewColored.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }

    @IBAction public func redSliderAction(_ sender: UISlider) {
        redLabel.text = String(round(sender.value * 100) / 100)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(sender.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenLabel.text = String(round(sender.value * 100) / 100)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(sender.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueLabel.text = String(round(sender.value * 100) / 100)
        
        viewColored.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(sender.value), alpha: 1)
    }
    
}

