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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserAuth.currentToken() != nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "play", sender: nil)
            }
        } else {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
