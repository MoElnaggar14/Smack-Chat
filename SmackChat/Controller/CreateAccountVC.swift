//
//  CreateAccountVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/19/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usertxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var userimag: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
   
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TOCHANNEL , sender: nil)
    }
    
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
       guard let name = usertxt.text, usertxt.text != "" else { return }
       guard let email = emailtxt.text, emailtxt.text != "" else { return }
       guard let password = passwordtxt.text, passwordtxt.text != "" else { return }
        AuthServices.instance.RegisterUserEmail(email: email, password: password) { (success) in
            if success {
                AuthServices.instance.LoginUserEmail(email: email, password: password, Completion: { (success) in
                    AuthServices.instance.CreateUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, Compleation: { (Success) in
                        self.performSegue(withIdentifier: UNWIND_TOCHANNEL, sender: nil)
                        print(UserDataService.instance.avatarName, UserDataService.instance.name)
                        
                    })
                })
            }
        }
    }
    
    @IBAction func PickAvatarImg(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATARPICKER, sender: nil)
    }
    
    
    @IBAction func PickGenerateBGColor(_ sender: Any) {
        
    }
    
}
