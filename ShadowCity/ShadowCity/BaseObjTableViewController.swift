//
//  BaseObjTableViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/12/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class BaseObjTableViewController: UITableViewController {
    var data = [BaseObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 300;
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset.top = UIApplication.shared.statusBarFrame.height
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TitleDetailTableViewCell else { return UITableViewCell() }
        
        cell.data = data[indexPath.row]
        
        return cell
    }
}
