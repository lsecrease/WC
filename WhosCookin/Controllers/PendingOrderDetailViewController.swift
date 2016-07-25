//
//  PendingOrderDetailViewController.swift
//  WhosCooking
//
//  Created by iwritecode on 7/20/16.
//  Copyright © 2016 ImagineMe. All rights reserved.
//

import UIKit


class PendingOrderDetailViewController: UIViewController {
    
    let cellId = "idCellOrderDetailPending"

    @IBOutlet weak var pendingOrderDetailTable: UITableView!

    // MARK: _ View life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Make user aware that the table is scrollable once view appears.
        
        pendingOrderDetailTable.flashScrollIndicators()
    }
    
    
    // MARK: - Custom functions
    func configureTable() {
        
        pendingOrderDetailTable.registerNib(UINib(nibName: "PendingOrderItemCell", bundle: nil), forCellReuseIdentifier: cellId)
        
    }
    
}

extension PendingOrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }
    
}
