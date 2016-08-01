//
//  FilterLayoutViewController.swift
//  WhosCookin
//
//  Created by iwritecode on 8/1/16.
//  Copyright © 2016 ImagineME. All rights reserved.
//

import UIKit

enum Filters: Int {
    
    case Dishes, Kitchens, Map
    
    static let count = 3
    
    var imageName: String {
        let imageNames = ["pot.png", "chicken.png", "Pin-1.png"
        ]
        return imageNames[rawValue]
    }
    
    var filterType : String {
        let filterTypes = ["Dishes", "Kitchens", "Map"]
        return filterTypes[rawValue]
    }
    
}


class FilterLayoutViewController: UIViewController {
    
    let cellID = "idCellFilterLayout"
    let cellNibname = "FilterLayoutTableViewCell"
    
    @IBOutlet weak var filterlayoutTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
        
    }
    
    func registerNibs() {
        filterlayoutTable.registerNib(UINib(nibName: cellNibname, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    
}

// MARK: - Table view data source

extension FilterLayoutViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! FilterLayoutTableViewCell
        
        if let filter = Filters(rawValue: indexPath.row) {
            cell.imageName = filter.imageName
            cell.filterType = filter.filterType
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
 
}
