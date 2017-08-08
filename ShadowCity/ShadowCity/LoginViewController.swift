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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction public func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction public func login() {
        guard let user = userNameField.text else { return }
        guard let pass = passwordField.text else { return }
        
        UserAuth.token(user: user, pass: pass, aHost: UserAuth.debugHost) { (success, message) in
            if success {
                //do some logged in shit.
                let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
