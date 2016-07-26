//
//  MealInventoryTableViewCell.swift
//  WhosCookin
//
//  Created by iwritecode on 7/25/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class MealInventoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealStatusLabel: UILabel!
    @IBOutlet weak var mealQuantityLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        if mealPriceLabel != nil {
            let width = mealPriceLabel.bounds.width
            mealPriceLabel.layer.cornerRadius = width / 2.0
            mealPriceLabel.clipsToBounds = true
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
