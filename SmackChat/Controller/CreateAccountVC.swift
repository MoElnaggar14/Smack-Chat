//
//  CreateAccountVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/19/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TOCHANNEL , sender: nil)
    }
    

}
