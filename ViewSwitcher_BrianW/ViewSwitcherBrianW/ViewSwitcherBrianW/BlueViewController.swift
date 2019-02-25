//
//  BlueViewController.swift
//  ViewSwitcherBrianW
//
//  Created by Brian Wawczak on 2/24/19.
//  Copyright © 2019 Brian Wawczak. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func blueButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Blue View Pressed", message: "You pressed the button on the blue view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
