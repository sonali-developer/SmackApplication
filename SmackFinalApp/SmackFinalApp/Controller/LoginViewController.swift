//
//  LoginViewController.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/2/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func createAccntPressed(_ sender: Any) {
     performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
       
    }
   
    
    @IBAction func closePressed(_ sender: Any) {
  //  dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
