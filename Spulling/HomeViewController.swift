//
//  HomeViewController.swift
//  Pullin'
//
//  Created by anis ben brahim on 13/02/2016.
//  Copyright © 2016 anis ben brahim. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            print("i am inn");
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        // Do any additional setup after loading the view.
    }


}
