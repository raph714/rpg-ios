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
        roll()
    }
    
    @IBAction func reRoll() {
        roll()
    }
    
    func roll() {
        CharacterCreation.rollStats { (stats) in
            for (stat, val) in stats {
                switch stat {
                case .charisma:
                    self.charisma.text = "\(val)"
                case .constitution:
                    self.constitution.text = "\(val)"
                case .dexterity:
                    self.dexterity.text = "\(val)"
                case .intelligence:
                    self.intelligence.text = "\(val)"
                case .strength:
                    self.strength.text = "\(val)"
                case .wisdom:
                    self.wisdom.text = "\(val)"
                }
            }
        }
    }
}
