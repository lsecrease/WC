//
//  SignUpViewController.swift
//  WhosCooking
//
//  Created by iwritecode on 7/17/16.
//  Copyright © 2016 ImagineMe. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - IBOutlet properties
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var existingAccountLabel: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    // MARK: - IBAction functions
    
    @IBAction func dismissVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        hideKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addCharacterSpacingToText()
        addObservers()

    }
    
    override func viewWillDisappear(animated: Bool) {
        removeObservers()
    }
    

    // MARK: - Custom functions

    func addObservers() {
        let notifCenter = NSNotificationCenter.defaultCenter()
        notifCenter.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        notifCenter.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func removeObservers() {
        let notifCenter = NSNotificationCenter.defaultCenter()
        notifCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: self.view.window)
        notifCenter.removeObserver(self, name: UIKeyboardWillHideNotification, object: self.view.window)
        
    }
    
    // Handle textField and keyboard visibility
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y == 0 {
                UIView.animateWithDuration(0.3, animations: {
                    self.view.frame.origin.y -= (keyboardSize.height - 100)
                })
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y != 0 {
                UIView.animateWithDuration(0.3, animations: {
                    self.view.frame.origin.y += (keyboardSize.height - 100)
                })
            }
        }
    }
    
    func hideKeyboard() {
        fullNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    // MARK: - UI Markup
    
    func addCharacterSpacingToText() {
        
        fullNameLabel.addCharacterSpacing(1.0)
        passwordLabel.addCharacterSpacing(1.0)
        existingAccountLabel.addCharacterSpacing(1.0)
        signInButton.titleLabel?.addCharacterSpacing(1.0)
        passwordTextField.addCharacterSpacing(3.0)
        
    }
    
}
