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
    
}

extension UIButton {
    
    func addBorderWithCornerRadius(borderWidth borderWidth: CGFloat, borderColor: CGColor, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        
    }
    
    
}