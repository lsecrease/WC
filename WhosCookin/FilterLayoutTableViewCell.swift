//
//  FilterLayoutTableViewCell.swift
//  WhosCookin
//
//  Created by iwritecode on 7/29/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class FilterLayoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var layoutImage: UIImageView!
    @IBOutlet weak var filterLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
