//
//  OrderViewController.swift
//  WhosCooking
//
//  Created by iwritecode on 7/19/16.
//  Copyright © 2016 ImagineMe. All rights reserved.
//

import UIKit
import XMSegmentedControl

class OrderViewController: UIViewController {

    let cellIdentifiers = [
        "idCellOrderPending",
        "idCellOrderFulfilled",
        "idCellOrderCancelled"
    ]
    
    var currentSegment = 0
    
    let spaceBetweenCells: CGFloat = 3.0
    
    
    @IBOutlet weak var pendingOrdersTableView: UITableView!
    @IBOutlet weak var fulfilledOrdersTableView: UITableView!
    @IBOutlet weak var cancelledOrdersTableView: UITableView!
    
    var tables = [UITableView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tables = [
            pendingOrdersTableView,
            fulfilledOrdersTableView,
            cancelledOrdersTableView
        ]
        
        configureSegmentedControl()
        registerCellNibs()
        
        pendingOrdersTableView.hidden = false
        fulfilledOrdersTableView.hidden = true
        cancelledOrdersTableView.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureSegmentedControl() {
        
        let frame = CGRect(x: 0, y: 70, width: self.view.frame.width, height: 55)
        
        let segmentTitles = ["PENDING", "FULFILLED", "CANCELLED"]
        var attributedTitles = [NSMutableAttributedString]()
        for title in segmentTitles {
            attributedTitles += [NSMutableAttributedString(string: title, attributes: [NSKernAttributeName: 1.0])]
        }
        
        
        let segmentedControl = XMSegmentedControl(frame: frame, segmentTitle: segmentTitles , selectedItemHighlightStyle: XMSelectedItemHighlightStyle.BottomEdge)
        
        segmentedControl.delegate = self
        segmentedControl.backgroundColor = UIColor.whiteColor()
        segmentedControl.highlightColor = UIColor(red: 80/255, green: 210/255, blue: 194/255, alpha: 1.0)
        segmentedControl.highlightTint = UIColor.blackColor()
        segmentedControl.tint = UIColor.blackColor()
        segmentedControl.font = UIFont(name: "Avenir-Book", size: 12.0)!
        
        self.view.addSubview(segmentedControl)
    }
    
    
    func registerCellNibs() {
        
        pendingOrdersTableView.registerNib(UINib(nibName: "PendingOrderTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifiers[0])
        fulfilledOrdersTableView.registerNib(UINib(nibName: "FulfilledOrderTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifiers[1])
        cancelledOrdersTableView.registerNib(UINib(nibName: "CancelledOrderTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifiers[2])
        
    }
    
}


// MARK: - UITableView Datasource and Delegate functions

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    // Using numberOfSections instead of numberOfRows
    // to get spacing effect between cells (see "Orders" artboards)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch tableView {
            
        case pendingOrdersTableView:
            cell = pendingOrdersTableView.dequeueReusableCellWithIdentifier(cellIdentifiers[0], forIndexPath: indexPath) as! PendingOrderTableViewCell
            
        case fulfilledOrdersTableView:
            cell = fulfilledOrdersTableView.dequeueReusableCellWithIdentifier(cellIdentifiers[1], forIndexPath: indexPath) as! FulfilledOrderTableViewCell
            
        case cancelledOrdersTableView:
            cell = cancelledOrdersTableView.dequeueReusableCellWithIdentifier(cellIdentifiers[2], forIndexPath: indexPath) as! CancelledOrderTableViewCell
            
        default:
            break
            
        }

        return cell
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return view.bounds.width / 2.0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return spaceBetweenCells
    }
    
}

extension OrderViewController: XMSegmentedControlDelegate {
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        print("SegmentedControl Selected Segment: \(selectedSegment)")
        
        currentSegment = selectedSegment
        
        switch selectedSegment {
            
        case 0:
            pendingOrdersTableView.hidden = false
            fulfilledOrdersTableView.hidden = true
            cancelledOrdersTableView.hidden = true
            
        case 1:
            pendingOrdersTableView.hidden = true
            fulfilledOrdersTableView.hidden = false
            cancelledOrdersTableView.hidden = true
            
        case 2:
            pendingOrdersTableView.hidden = true
            fulfilledOrdersTableView.hidden = true
            cancelledOrdersTableView.hidden = false
            
        default:
            break
            
        }
        

    }
}



