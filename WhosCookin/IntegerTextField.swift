//
//  IntegerTextField.swift
//  WhosCookin
//
//  Created by iwritecode on 8/3/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class IntegerTextField:  UITextField {
    
    struct Number {
        
        static let formatter: NSNumberFormatter = {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .NoStyle
            formatter.locale = NSLocale.currentLocale()
            formatter.maximumIntegerDigits = 4
            formatter.maximumFractionDigits = 0
            return formatter
        }()
        
    }
    
    var stringValue : String { return text ?? "" }
    
    var integerValue: Int    { return Int(numbersOnly) ?? 0 }
    
    var numberString    : String { return Number.formatter.stringFromNumber(integerValue) ?? "" }
    
    var numbersOnly : String {
        return stringValue.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "0123456789").invertedSet).joinWithSeparator("")
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        addTarget(self, action: #selector(IntegerTextField.editingChanged(_:)), forControlEvents: .EditingChanged)
        keyboardType = .NumberPad
        editingChanged(self)
        
    }
    
    func editingChanged(sender: UITextField) { sender.text = numberString }
    
}