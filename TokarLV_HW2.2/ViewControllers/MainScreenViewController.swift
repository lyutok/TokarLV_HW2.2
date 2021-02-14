//
//  MainScreenViewController.swift
//  TokarLV_HW2.2
//
//  Created by Lyudmila Tokar on 2/14/21.
//

import UIKit

protocol ViewControllerDelegate {
    func setNewBackgroundColor (for backgroundViewController: UIColor)
}

class MainScreenViewController: UIViewController {
        
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewVC = segue.destination as? ViewController else { return }
        viewVC.delegate = self
        
    }
}

extension MainScreenViewController: ViewControllerDelegate {
    func setNewBackgroundColor(for backgroundViewController: UIColor) {
        view.backgroundColor = backgroundViewController
    }

}
