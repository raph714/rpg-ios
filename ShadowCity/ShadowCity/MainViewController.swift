//
//  MainViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/7/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserAuth.currentToken() != nil {
            performSegue(withIdentifier: "play", sender: nil)
        } else {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
