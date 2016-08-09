//
//  AddNewDishViewController.swift
//  WhosCookin
//
//  Created by iwritecode on 7/28/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class AddNewDishViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    @IBOutlet weak var imageButton3: UIButton!
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var prepTimeTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!

    @IBOutlet weak var arrowImageView: UIImageView!
    
    let actionToolbar = ActionToolbar()
    
    var currentButton: UIButton?
    var currentTextField: UITextField?
    var isPointingDown = false
    
    var datePicker = UIDatePicker()
    var picker1 = UIPickerView()
    var picker2 = UIPickerView()
    
    
    @IBAction func addImage(sender: UIButton) {
        currentButton = sender
        if sender.currentImage == nil {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addObservers()
        addButtonBorders()
        configurePickerViews()
        
        dateTextField.inputView = datePicker
        
        dateTextField.addActionToolbar()
        priceTextField.addActionToolbar()
        quantityTextField.addActionToolbar()
        locationTextField.addActionToolbar()
        prepTimeTextField.addActionToolbar()
        categoryTextField.addActionToolbar()
        
    }
        
    func configurePickerViews() {
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        datePicker.datePickerMode = .Date
        datePicker.locale = NSLocale.currentLocale()
        datePicker.minuteInterval = 15
        datePicker.minimumDate = NSDate()
        
        picker1 = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        picker1.delegate = self
        picker1.dataSource = self
        
        picker2 = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        picker1.delegate = self
        picker1.dataSource = self
        
    }
    
    func addButtonBorders() {
        
        let borderWidth: CGFloat = 0.8
        let borderColor = UIColor.darkGrayColor().CGColor
        let cornerRadius: CGFloat = 5.0
        
        imageButton1.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton2.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton3.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)

    }
    
    func addObservers() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddNewDishViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddNewDishViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func removeObservers() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height - 60.0
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height - 60.0
        }
    }

    
}

// MARK: - UITextField Delegate methods

extension AddNewDishViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        var offsetY: CGFloat!
        
        switch textField {
        case dateTextField:
            offsetY = 100
        case priceTextField, quantityTextField:
            offsetY = 150
            
        default:
            break
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)

        
        return true
    }
        
}

// MARK: - UIPickerView Delegate methods

extension AddNewDishViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }
    
}

// MARK: - UIImagePickerController delegate methods

extension AddNewDishViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        currentButton?.setImage(image, forState: .Normal)
        currentButton?.contentMode = .ScaleAspectFill
        currentButton?.clipsToBounds = true
        
    }
    
}
