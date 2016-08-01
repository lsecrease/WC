//
//  PendingOrderTableViewCell.swift
//  WhosCooking
//
//  Created by iwritecode on 7/20/16.
//  Copyright © 2016 ImagineMe. All rights reserved.
//

import UIKit

class PendingOrderTableViewCell: OrderTableViewCell {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var pendingLabel: UILabel!
    
    override var restaurantName: String? {
        didSet {
            restaurantNameLabel.text = restaurantName
        }
    }
    
    override var foodName: String? {
        didSet {
            foodNameLabel.text = foodName
        }
    }
    
    override var numberOfItems: Int? {
        didSet {
            // numberOfItemsLabel.text = "\(numberOfItems)"
            numberOfItemsLabel.text = String(numberOfItems)

        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if numberOfItemsLabel != nil {
            let height = numberOfItemsLabel.bounds.height
            numberOfItemsLabel.layer.cornerRadius = height / 2.0
            numberOfItemsLabel.clipsToBounds = true
        }
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
