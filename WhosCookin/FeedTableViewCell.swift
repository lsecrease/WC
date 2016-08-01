//
//  FeedTableViewCell.swift
//  Feed Table
//
//  Created by iwritecode on 7/28/16.
//  Copyright © 2016 iwritecode. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet cell properties
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var container: UIView!
    

    
    // MARK: - Cell properties
    
    var foodName = "" {
        didSet {
            foodNameLabel.text = foodName
        }
    }
    
    var distance = "" {
        didSet {
            distanceLabel.text = distance
        }
    }

    var foodPrice = "" {
        didSet {
            foodPriceLabel.text = foodPrice
        }
    }
    
    var rating = "" {
        didSet {
            ratingLabel.text = rating
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if foodPriceLabel != nil {
            let width = foodPriceLabel.bounds.width
            foodPriceLabel.layer.cornerRadius = width / 2.0
        }
        
        foodImage.image = UIImage(named: "crepe")
        
    }
    
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
}
