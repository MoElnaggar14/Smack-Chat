//
//  ProfileVC.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 2/5/18.
//  Copyright © 2018 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileImg: circleImage!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()
    }
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func logoutBtn(_ sender: Any) {
        UserDataService.instance.logout()
        NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func SetupView() {
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        nameLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        
        let Tap = UITapGestureRecognizer(target: self, action: #selector(Tapped(_:)))
        bgView.addGestureRecognizer(Tap)
        
    }
    
    @objc func Tapped(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
