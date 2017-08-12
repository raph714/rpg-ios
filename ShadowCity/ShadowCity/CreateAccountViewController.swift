//
//  CreateAccountViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/7/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var password2Field: UITextField!
    
    @IBAction public func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction public func createAccount() {
        guard let user = userNameField.text else { return }
        guard let pass = passwordField.text else { return }
        guard let pass2 = password2Field.text else { return }
        
        if pass != pass2 {
            let alert = UIAlertController(title: "Oops", message: "Passwords need to match! Give it another shot.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else  {
            UserAuth.createAccount(user: user, pass: pass) { (result) in
                if result.success {
                    //do some logged in shit.
                    let alert = UIAlertController(title: "Success", message: result.message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        self.performSegue(withIdentifier: "createCharacter", sender: self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Oops", message: result.message, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                }
            }
        }
    }
}
