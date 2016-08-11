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
    
    let lightGray = UIColor.lightGrayColor()

    
    // MARK: - Cell properties
    
    var foodName = "" {
        didSet {
            foodNameLabel.text = foodName
        }
    }
    
    var distance = "" {
        didSet {
            
            let endString = " miles"
            let location = distance.characters.count
            let length = endString.characters.count
            let distanceString = distance + endString
            let mutableDistanceString = NSMutableAttributedString(string: distanceString)
            mutableDistanceString.addAttribute(NSForegroundColorAttributeName, value: lightGray, range: NSRange(location: location, length: length))
            distanceLabel.attributedText = mutableDistanceString
        }
    }

    var foodPrice = "" {
        didSet {
            foodPriceLabel.text = foodPrice
        }
    }
    
    var rating = "" {
        didSet {
            let endString = " rating"
            let location = rating.characters.count
            let length = endString.characters.count
            let ratingString = rating + endString
            let mutableRatingString = NSMutableAttributedString(string: ratingString)
            mutableRatingString.addAttribute(NSForegroundColorAttributeName, value: lightGray, range: NSRange(location: location, length: length))
            ratingLabel.attributedText = mutableRatingString
            
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
