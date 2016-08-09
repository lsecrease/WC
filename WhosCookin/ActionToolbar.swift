//
//  ActionToolbar.swift
//  WhosCookin
//
//  Created by iwritecode on 8/6/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

//protocol ActionToolbarDelegate {
//    func cancelButtonPressed()
//    func doneButtonPressed()
//}

class ActionToolbar: UIToolbar {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        superview?.resignFirstResponder()
    }
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        superview?.resignFirstResponder()
    }
    
}
