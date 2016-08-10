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
    var currentY: CGFloat = 0
    
    // Picker Views
    var currentButton: UIButton?
    var currentTextField: UITextField?
    var isPointingDown = false
    
    var datePicker = UIDatePicker()
    
    var categoryPicker = UIPickerView()
    let categories = ["A", "B", "C", "D", "E", "F", "G"]
    
    var prepTimePicker = UIPickerView()
    var times = [String]()
    let timeUnits = ["Minutes", "Hours"]
    let maxTime = 60
    
    
    @IBAction func addImage(sender: UIButton) {
        currentButton = sender
        if sender.currentImage == nil {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        currentY = self.view.frame.origin.y
        
        // addObservers()
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
        datePicker.addTarget(self, action: #selector(self.setDate), forControlEvents: .ValueChanged)
        dateTextField.inputView = datePicker
        
        prepTimePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        addTimes()
        prepTimePicker.delegate = self
        prepTimePicker.dataSource = self
        prepTimeTextField.inputView = prepTimePicker
        
        categoryPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryTextField.inputView = categoryPicker
        
    }
    
    func setDate() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateTextField.text = dateFormatter.stringFromDate(datePicker.date)
    }
    
    func updatePrepTime() {
        let timeString = times[prepTimePicker.selectedRowInComponent(0)]
        let unitString = timeUnits[prepTimePicker.selectedRowInComponent(1)]
        
        prepTimeTextField.text = timeString + " " + unitString
    }
    
    func addButtonBorders() {
        
        let borderWidth: CGFloat = 0.8
        let borderColor = UIColor.darkGrayColor().CGColor
        let cornerRadius: CGFloat = 5.0
        
        imageButton1.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton2.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)
        
        imageButton3.addBorderWithCornerRadius(borderWidth: borderWidth, borderColor: borderColor, cornerRadius: cornerRadius)

    }
    
    
}

// MARK: - UITextField Delegate methods

extension AddNewDishViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        
        var offsetY = CGFloat()
        
        switch textField {
        case dateTextField:
            offsetY = 100
        case priceTextField, quantityTextField:
            offsetY = 150
        case locationTextField, prepTimeTextField, categoryTextField:
            offsetY = 200
            
        default:
            break
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.resignFirstResponder()
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

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
                return timeUnits.count
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
                return timeUnits[row]
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        switch pickerView {
            
        case prepTimePicker:
            
            updatePrepTime()
            
        case categoryPicker:
            
            categoryTextField.text = categories[row]
            
        default:
            break
        }
        
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
