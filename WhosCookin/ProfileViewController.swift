//
//  ProfileViewController.swift
//  WhosCookin
//
//  Created by iwritecode on 7/25/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit
import XMSegmentedControl

class ProfileViewController: UIViewController {
    
    let cellId = "idCellProfileMealInventory"

    @IBOutlet weak var segmentedControl: XMSegmentedControl!
    @IBOutlet weak var mealInventoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSegmentedControl()
        registerCellNibs()
        
    }
    
    func registerCellNibs() {
        mealInventoryTable.registerNib(UINib(nibName: "MealInventoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func configureSegmentedControl() {
        
        let frame = CGRect(x: 0, y: 242, width: self.view.frame.width, height: 60)
        
        let segmentTitles = ["Meal Inventory", "Meals Ordered", "Meal Ratings"]
        var attributedTitles = [NSMutableAttributedString]()
        
        for title in segmentTitles {
            attributedTitles += [NSMutableAttributedString(string: title, attributes: [NSKernAttributeName: 1.0])]
        }
        
        let segmentedControl = XMSegmentedControl(frame: frame, segmentTitle: segmentTitles , selectedItemHighlightStyle: XMSelectedItemHighlightStyle.Background)
        
        segmentedControl.delegate = self
        segmentedControl.backgroundColor = UIColor.whiteColor()
        segmentedControl.highlightColor = UIColor(red: 80/255, green: 210/255, blue: 194/255, alpha: 1.0)
        segmentedControl.highlightTint = UIColor.whiteColor()
        segmentedControl.tint = UIColor.blackColor()
        segmentedControl.font = UIFont(name: "Avenir-Book", size: 18.0)!
        
        self.view.addSubview(segmentedControl)
    }
    
}


// MARK: - UITableView Datasource and Delegate functions

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = mealInventoryTable.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! MealInventoryTableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 100
        
    }
}


// MARK: - XMSegmentedControl Dealegate

extension ProfileViewController: XMSegmentedControlDelegate {
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        print("SegmentedControl Selected Segment: \(selectedSegment)")
        
    }
}

