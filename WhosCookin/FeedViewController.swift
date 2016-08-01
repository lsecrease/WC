//
//  FeedViewController.swift
//  Feed Table
//
//  Created by iwritecode on 7/28/16.
//  Copyright © 2016 iwritecode. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // var tabBarHeight = CGFloat()
    let feedCellID = "idCellFeed"
    let feedTableNibName = "FeedTableViewCell"
    
    @IBOutlet weak var feedTable: UITableView!
    
    let names = [
        "Apple-Strawberry Crepes",
        "Banana Split",
        "Buttermilk Pancakes",
        "Pecan Pie"
    ]
    
    let distances = [5, 79, 879, 3]
    let ratings = [8.4, 7.0, 5.3, 9.9]

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        // self.tabBarHeight = (self.tabBarController?.tabBar.frame.height)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton

        registerNibs()

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNibs() {
        feedTable.registerNib(UINib(nibName: feedTableNibName, bundle: nil), forCellReuseIdentifier: feedCellID)
    }
    
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = feedTable.dequeueReusableCellWithIdentifier(feedCellID, forIndexPath: indexPath) as! FeedTableViewCell
        
        cell.foodImage.image = UIImage(named: "crepe")
        cell.foodName = names[indexPath.row]
        cell.distance = "\(distances[indexPath.row])"
        cell.rating = "\(ratings[indexPath.row])"
        cell.foodPrice = "$15"
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableHeight = feedTable.frame.size.height
        
        return tableHeight / 2.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row clicked")
    }
}
