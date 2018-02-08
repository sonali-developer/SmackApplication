//
//  CreateAccountViewController.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/2/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
// Outlets
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closePressed(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != ""  else { return }
        print("\(email)")
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return }
        print("\(pass)")
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("Registered User")
            }
        }
    }
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
}
