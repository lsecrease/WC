//
//  OrderTableViewCell.swift
//  WhosCooking
//
//  Created by iwritecode on 7/19/16.
//  Copyright © 2016 ImagineMe. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    var restaurantName: String?
    var foodName: String?
    var numberOfItems: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
