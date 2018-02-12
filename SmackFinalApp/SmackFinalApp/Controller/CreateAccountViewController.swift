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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // Variables
    var avatarName = "Profile Default"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }

    @IBAction func closePressed(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
             self.userImg.backgroundColor = self.bgColor
            
        }
       
    }
    
    func setUpView() {
        spinner.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
         emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
            passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountViewController.handleTap))
        view.addGestureRecognizer(tap)
        
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
}
