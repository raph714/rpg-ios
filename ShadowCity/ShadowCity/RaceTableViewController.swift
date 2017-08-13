//
//  RaceTableViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/12/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class RaceTableViewController: BaseObjTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharacterCreation.dataFor(step: .selectRace) { (newData) in
            self.data = newData
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < data.count else { return }
        
        let choice = data[indexPath.row]
        CharacterCreation.update(data: ["race": choice.id])
        
        performSegue(withIdentifier: "chooseClass", sender: self)
    }
}
