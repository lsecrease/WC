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
    
    // Picker Views
    var currentButton: UIButton?
    var currentTextField: UITextField?
    var isPointingDown = false
    
    var datePicker = UIDatePicker()
    
    var categoryPicker = UIPickerView()
    let categories = ["A", "B", "C", "D", "E", "F", "G"]
    
    var prepTimePicker = UIPickerView()
    var times = [String]()
    let timeMeasures = ["Minutes", "Hours"]
    let maxTime = 60
    
    
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
        
        
        
        dateTextField.addActionToolbar()
        priceTextField.addActionToolbar()
        quantityTextField.addActionToolbar()
        locationTextField.addActionToolbar()
        prepTimeTextField.addActionToolbar()
        categoryTextField.addActionToolbar()
        
    }
    
    func addTimes() {
        for t in 1...maxTime {
            self.times += ["\(t)"]
        }
    }
        
    func configurePickerViews() {
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        datePicker.datePickerMode = .Date
        datePicker.locale = NSLocale.currentLocale()
        datePicker.minuteInterval = 15
        datePicker.minimumDate = NSDate()
        dateTextField.inputView = datePicker
        
        addTimes()
        prepTimePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        prepTimePicker.delegate = self
        prepTimePicker.dataSource = self
        prepTimeTextField.inputView = prepTimePicker
        
        categoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryTextField.inputView = categoryPicker
        
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
        
        var components = Int()
        
        switch pickerView {
            
        case prepTimePicker:
            components = 2
            
        case categoryPicker:
            components = 1
            
        default:
            break
        }
        
        return components
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        switch pickerView {
            
        case prepTimePicker:
            switch component {
            case 0:
                return times.count
            case 1:
                return timeMeasures.count
            default:
                break
            }
            
        case categoryPicker:
            return categories.count
            
        default:
            break
        }
        
        return 1

    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
            
        case prepTimePicker:
            switch component {
            case 0:
                return times[row]
            case 1:
                return timeMeasures[row]
            default:
                break
            }
            
        case categoryPicker:
            return categories[row]
            
        default:
            break
        }
        
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
