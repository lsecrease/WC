//
//  LocationSearchViewController.swift
//  Who's Cookin'?
//
//  Created by iwritecode on 7/22/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController {
    
    @IBOutlet weak var locationSearchButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationSearchButton.layer.cornerRadius = 5.0
        locationTextField.adjustsFontSizeToFitWidth = true
        
    }
    
}
