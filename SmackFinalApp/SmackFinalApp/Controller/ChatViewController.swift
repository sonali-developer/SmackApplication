//
//  ChatViewController.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 1/30/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())

        // Do any additional setup after loading the view.
    }

   

}
