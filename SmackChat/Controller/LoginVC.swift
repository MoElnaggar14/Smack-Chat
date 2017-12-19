//
//  LoginVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/18/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func closePressedBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATEACCOUNT, sender: nil)
    }
    
}
