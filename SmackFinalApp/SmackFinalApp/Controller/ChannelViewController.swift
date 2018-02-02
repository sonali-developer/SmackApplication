//
//  ChannelViewController.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 1/30/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {
// Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
   

}
