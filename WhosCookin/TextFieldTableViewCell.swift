//
//  TextFieldTableViewCell.swift
//  WhosCookin
//
//  Created by iwritecode on 8/10/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var valueLabel1: UILabel!
    @IBOutlet weak var valueLabel2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}