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

    @IBOutlet weak var segmentedControl: XMSegmentedControl!
    @IBOutlet weak var segmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSegmentedControl()
        
    }
    
    func configureSegmentedControl() {
        
        let frame = CGRect(x: 0, y: 252, width: self.view.frame.width, height: 60)
        
        let segmentTitles = ["Meals Inventory", "Meals Ordered", "Meal Ratings"]
        var attributedTitles = [NSMutableAttributedString]()
        
        for title in segmentTitles {
            attributedTitles += [NSMutableAttributedString(string: title, attributes: [NSKernAttributeName: 1.0])]
        }
        
        let segmentedControl = XMSegmentedControl(frame: frame, segmentTitle: segmentTitles , selectedItemHighlightStyle: XMSelectedItemHighlightStyle.Background)
        
        segmentedControl.delegate = self
        segmentedControl.backgroundColor = UIColor.whiteColor()
        segmentedControl.highlightColor = UIColor(red: 80/255, green: 210/255, blue: 194/255, alpha: 1.0)
        segmentedControl.highlightTint = UIColor.blackColor()
        segmentedControl.tint = UIColor.blackColor()
        segmentedControl.font = UIFont(name: "Avenir-Book", size: 18.0)!
        
        self.view.addSubview(segmentedControl)
    }
    
}

extension ProfileViewController: XMSegmentedControlDelegate {
    
    func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        print("SegmentedControl Selected Segment: \(selectedSegment)")
        
    }
}

