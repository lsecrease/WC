//
//  FoodCategoryViewController.swift
//  CollectionViewTest
//
//  Created by iwritecode on 7/23/16.
//  Copyright © 2016 iwritecode. All rights reserved.
//

import UIKit

class FoodCategoryViewController: UIViewController {
    
    let spacing: CGFloat = 10.0

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
    
    func configureCollectionView() {
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        categoryCollectionView.collectionViewLayout = layout
        
//        categoryCollectionView.layer.shadowColor = UIColor.blackColor().CGColor
//        categoryCollectionView.layer.shadowOffset = CGSizeMake(0, 2)
//        categoryCollectionView.layer.shadowOpacity = 1
//        categoryCollectionView.layer.shadowRadius = 5.0
//        categoryCollectionView.clipsToBounds = false
//        categoryCollectionView.layer.masksToBounds = true
        
    }
    
    
}

// MARK: - UICollectionView DtaSource and Delegate functions

extension FoodCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! FoodCategoryCollectionViewCell
        
        cell.categoryImage.image = UIImage(named: "salad")
        cell.categoryLabel.text = "Vegan"
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        
//        let layout = collectionViewLayout as! UICollectionViewFlowLayout
//        let numberOfItemsPerRow = 2
//        let totalSpace = layout.sectionInset.left + layout.sectionInset.right + (layout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow))
//        
//        let width = (collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow)
//        
//        let height = width * 1.5
//        
//        return CGSize(width: width, height: height)
//        
//    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let width = view.bounds.size.width
        let cellWidth = (width / 2) - (spacing * 1.5)
        
        // Set height as a finction of label height
        let cellHeight = cellWidth * 1.4
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}

extension FoodCategoryViewController: UICollectionViewDelegateFlowLayout {
    
    
}