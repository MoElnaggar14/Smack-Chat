//
//  ChatVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/18/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var menuBar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBar.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        

       
    }

 

}
