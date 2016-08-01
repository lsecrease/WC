//
//  EditProfileViewController.swift
//  Edit Profile
//
//  Created by iwritecode on 7/25/16.
//  Copyright © 2016 iwritecode. All rights reserved.
//

import UIKit


class EditProfileViewController: UIViewController {
    
    let cellIdentifiers = [
        "idCellTextField",
        "idCellTextField",
        "idCellTextField",
        "idCellMultiInput",
        "idCellTextField",
        "idCellTextField"
    ]
    
    
    @IBOutlet weak var profileTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellNibs()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCellNibs() {
        profileTableView.registerNib(UINib(nibName: "TextFieldTableViewCell", bundle: nil) , forCellReuseIdentifier: "idCellTextField")
        profileTableView.registerNib(UINib(nibName: "MultiInputTableViewCell", bundle: nil) , forCellReuseIdentifier: "idCellMultiInput")
    }
    

}

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = profileTableView.dequeueReusableCellWithIdentifier(cellIdentifiers[indexPath.row], forIndexPath: indexPath) as! EditProfileTableViewCell
        
        switch indexPath.row {
        
        case 0:
            cell.titleLabel.text = "NAME"
            
        case 1:
            cell.titleLabel.text = "KITCHEN NAME"
            
        case 2:
            cell.titleLabel.text = "EMAIL"
            
        case 3:
            cell.valueLabel1.text = "FROM"
            cell.valueLabel2.text = "TO"
            
        case 4:
            cell.titleLabel.text = "LOCATION"
            
        case 5:
            cell.titleLabel.text = "NOTIFY"
            
        default:
            break
            
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
}
