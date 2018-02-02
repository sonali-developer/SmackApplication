//
//  CreateAccountViewController.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/2/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closePressed(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: UNWIND, sender: nil)
        
    }
    
    

    
}
