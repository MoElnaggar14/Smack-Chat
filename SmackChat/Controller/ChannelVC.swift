//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/18/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareforUnwidSegue (segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 60

    }


    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    
    


}
