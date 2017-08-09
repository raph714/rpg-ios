//
//  LoginViewController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/7/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction public func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction public func login() {
        guard let user = userNameField.text else { return }
        guard let pass = passwordField.text else { return }
        
        UserAuth.token(user: user, pass: pass, aHost: UserAuth.debugHost) { (success, message) in
            if success {
                self.dismiss(animated: false, completion: nil)
            } else {
                let alert = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            }
        }
    }
}
