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
    @IBOutlet weak var spineer: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()

       
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userimag.image = UIImage(named: UserDataService.instance.avatarName)
              avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && userimag.backgroundColor == nil {
                userimag.backgroundColor = UIColor.lightGray
            }
        }
    }


    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TOCHANNEL , sender: nil)
    }
    
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        spineer.isHidden = false
        spineer.startAnimating()
       guard let name = usertxt.text, usertxt.text != "" else { return }
       guard let email = emailtxt.text, emailtxt.text != "" else { return }
       guard let password = passwordtxt.text, passwordtxt.text != "" else { return }
        AuthServices.instance.RegisterUserEmail(email: email, password: password) { (success) in
            if success {
                AuthServices.instance.LoginUserEmail(email: email, password: password, Completion: { (success) in
                    AuthServices.instance.CreateUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, Compleation: { (Success) in
                        self.spineer.stopAnimating()
                        self.spineer.isHidden = true
                        self.performSegue(withIdentifier: UNWIND_TOCHANNEL, sender: nil)
                        
                        // notification
                        NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
                        
                        
                    })
                })
            }
        }
    }
    
    @IBAction func PickAvatarImg(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATARPICKER, sender: nil)
    }
    
    
    @IBAction func PickGenerateBGColor(_ sender: Any) {
      let r = CGFloat(arc4random_uniform(255)) / 255
      let g = CGFloat(arc4random_uniform(255)) / 255
      let b = CGFloat(arc4random_uniform(255)) / 255
      
        
        bgColor = UIColor(red: r, green: b, blue: g, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        UIView.animate(withDuration: 0.2) {
            self.userimag.backgroundColor = self.bgColor
        }
    }
    
    func setView() {
        spineer.isHidden = true
        usertxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurpleColor])
        emailtxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurpleColor])
        passwordtxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurpleColor])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
