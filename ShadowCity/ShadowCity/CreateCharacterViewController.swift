//
//  CreateCharacterViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/8/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit
import Alamofire

class CreateCharacterViewController: UIViewController {
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var dexterity: UILabel!
    @IBOutlet weak var constitution: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var wisdom: UILabel!
    @IBOutlet weak var charisma: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
