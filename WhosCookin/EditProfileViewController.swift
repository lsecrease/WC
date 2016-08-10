//
//  EditProfileViewController.swift
//  EditProfileScreen
//
//  Created by iwritecode on 8/10/16.
//  Copyright © 2016 iwritecode. All rights reserved.
//

import UIKit
import CoreLocation

class EditProfileViewController: UIViewController {
    
    // MARK: - IBOutlet properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var kitchenNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var notifyTextField: UITextField!
    @IBOutlet weak var notifyMethodTextField: UITextField!
    
    
    var startTimePicker = UIDatePicker()
    var endTimePicker = UIDatePicker()
    var notifyMethodPickerView = UIPickerView()
    
    let notifyMethods = ["Text", "Email", "Voice call"]
    

    @IBAction func locationButtonPressed(sender: UIButton) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom functions
    
    func configureViews() {
        
        configureTextFields()
        configurePickerViews()
        
    }
    
    func configureTextFields() {
        nameTextField.addActionToolbar()
        kitchenNameTextField.addActionToolbar()
        emailTextField.addActionToolbar()
        startTimeTextField.addActionToolbar()
        endTimeTextField.addActionToolbar()
        locationTextField.addActionToolbar()
        notifyTextField.addActionToolbar()
        notifyMethodTextField.addActionToolbar()
    }
    
    func configurePickerViews() {
        
        startTimePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        startTimePicker.minimumDate = NSDate()
        startTimePicker.locale = NSLocale.currentLocale()
        startTimePicker.minuteInterval = 5
        startTimePicker.addTarget(self, action: #selector(self.setTime(_:textField:)), forControlEvents: .ValueChanged)
        startTimeTextField.inputView = startTimePicker
        
        endTimePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        endTimePicker.minimumDate = NSDate()
        endTimePicker.minuteInterval = 5
        endTimePicker.addTarget(self, action: #selector(self.setTime(_:textField:)), forControlEvents: .ValueChanged)
        endTimeTextField.inputView = endTimePicker
        
        
        notifyMethodPickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        notifyMethodPickerView.dataSource = self
        notifyMethodPickerView.delegate = self
        notifyMethodTextField.inputView = notifyMethodPickerView
        
    }
    
    
    func setTime(time: NSDate, textField: UITextField) {
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .MediumStyle
        textField.text = timeFormatter.stringFromDate(time)
    }


}

extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        
    }
    
}


extension EditProfileViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return notifyMethods[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return notifyMethods.count
    }
    
}













