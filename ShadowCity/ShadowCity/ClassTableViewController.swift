//
//  ClassTableViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/12/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class ClassTableViewController: BaseObjTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CharacterCreation.dataFor(step: .selectClass) { (newData) in
            self.data = newData
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < data.count else { return }
        
        let choice = data[indexPath.row]
        CharacterCreation.update(data: ["class": choice.id])
    
        CharacterCreation.completeCharCreation { (result) in
            if result.success {
                self.performSegue(withIdentifier: "play", sender: self)
            } else {
                let alert = UIAlertController(title: "Uh Oh", message: result.message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
