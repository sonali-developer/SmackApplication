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
    
// Variables
    var avatarName = "Profile Default"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }

    @IBAction func closePressed(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = userNameTxt.text, userNameTxt.text != "" else { return }
         print("\(name)")
        guard let email = emailTxt.text, emailTxt.text != ""  else { return }
        print("\(email)")
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return }
        print("\(pass)")
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("Registered User")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        
                        print("Logged in user!",AuthService.instance.authToken)
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                
                            }
                        })
                    }
                })
            }
        }
    }
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    
}
