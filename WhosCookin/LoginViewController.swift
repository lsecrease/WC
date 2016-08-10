//
//  LoginViewController.swift
//  Who's Cookin'?
//
//  Created by iwritecode on 7/22/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var noAccountLabel: UILabel!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        hideKeyboard()
    }
    
    @IBAction func signInButtonPressed(sender: UIButton) {
        
        let username = emailTextField.text
        let password = passwordTextField.text
        
        // Sample Validation
        
        if username?.characters.count < 5 {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a valid email address.", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
        
        } else if password?.characters.count < 6 {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a valid password", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
            spinner.startAnimating()
            
            // Perform login with credentials
            
            
        }
        
    }
    
    @IBAction func signUpButtonPressed(sender: UIButton) {
        hideKeyboard()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObservers()
        addCharacterSpacingToText()
        
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
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    // UI Markup
    
    func addCharacterSpacingToText() {
        
        usernameLabel.addCharacterSpacing(1.0)
        passwordLabel.addCharacterSpacing(1.0)
        noAccountLabel.addCharacterSpacing(1.0)
        signUpButton.titleLabel?.addCharacterSpacing(1.0)
        passwordTextField.addCharacterSpacing(3.0)
        
    }
    
    
}
