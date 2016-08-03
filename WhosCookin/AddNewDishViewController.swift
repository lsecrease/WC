//
//  AddNewDishViewController.swift
//  WhosCookin
//
//  Created by iwritecode on 7/28/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class AddNewDishViewController: UIViewController {
    
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    @IBOutlet weak var imageButton3: UIButton!
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    var currentButton: UIButton?
    var currentTextField: UITextField?
    
    @IBAction func addImage(sender: UIButton) {
        
        currentButton = sender
        
        if sender.currentImage == nil {
//            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
//                let imagePicker = UIImagePickerController()
//                // imagePicker.delegate = self
//                imagePicker.allowsEditing = false
//                imagePicker.sourceType = .PhotoLibrary
//                
//                self.presentViewController(imagePicker, animated: true, completion: nil)
//            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        addButtonBorders()
        addObservers()
    }
    
    func configureImagePicker() {
        
    }
    
    func addButtonBorders() {
        let borderWidth: CGFloat = 0.8
        let borderColor = UIColor.darkGrayColor().CGColor
        let cornerRadius: CGFloat = 5.0
        
        imageButton1.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton2.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton3.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)

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
                    self.view.frame.origin.y -= keyboardSize.height
                })
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y != 0 {
                UIView.animateWithDuration(0.3, animations: {
                    self.view.frame.origin.y += keyboardSize.height
                })
            }
        }
    }
    
}

extension AddNewDishViewController: UITextFieldDelegate {
    
    
}

extension AddNewDishViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        currentButton?.setImage(image, forState: .Normal)
        currentButton?.contentMode = .ScaleAspectFill
        currentButton?.clipsToBounds = true
        
    }
    
}
