//
//  Extensions.swift
//  Who's Cookin'?
//
//  Created by iwritecode on 7/22/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

extension UILabel {
    
    func addCharacterSpacing(spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
    
}

extension UITextField {
    
    func addCharacterSpacing(spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
    
    func addActionToolbar() {
        
        let actionToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: super.bounds.width, height: 45))
        actionToolbar.barStyle = .BlackTranslucent
        actionToolbar.setBackgroundImage(UIImage(), forToolbarPosition: .Any, barMetrics: .Default)
        actionToolbar.setShadowImage(UIImage(), forToolbarPosition: .Any)
        actionToolbar.tintColor = UIColor.whiteColor()
        actionToolbar.backgroundColor = UIColor.darkGrayColor()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let donebutton = UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(self.resignFirstResponder))
        // let cancelButton = UIBarButtonItem(title: "Cancel", style: .Done, target: self, action: #selector(self.clearAndHideKeyboard))
        
        actionToolbar.setItems([flexibleSpace, donebutton], animated: true)
        actionToolbar.sizeToFit()
        actionToolbar.userInteractionEnabled = true
        
        self.inputAccessoryView = actionToolbar
    }
    
    func clearAndHideKeyboard() {
        self.text = ""
        self.resignFirstResponder()
        
    }

    
}

extension UIButton {
    
    func addBorderWithCornerRadius(borderWidth borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        var int = UInt32()
        NSScanner(string: hex).scanHexInt(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}