//
//  HomeTableViewController.swift
//  WhosCookin
//
//  Created by iwritecode on 7/31/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var rating: Double = 8.4 {
        didSet {
            ratingLabel.text = String(rating)
        }
    }
    
    let maxRating: Double = 10.0

    @IBOutlet weak var homeTable: UITableView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var mapViewCell: UITableViewCell!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var circularGraph: KDCircularProgress!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        detailLabel.sizeToFit()
        let height = priceLabel.bounds.height
        priceLabel.layer.cornerRadius = height / 2.0
        priceLabel.clipsToBounds = true
        
        setGraphAngle(rating)
        
    }
    
    func setGraphAngle(rating: Double) {
        ratingLabel.text = String(rating)
        let endAngle = (rating / maxRating) * 360
        circularGraph.animateFromAngle(0, toAngle: endAngle, duration: 1.0, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath == 2 {
            
            // Do something....
        }
    }


}
