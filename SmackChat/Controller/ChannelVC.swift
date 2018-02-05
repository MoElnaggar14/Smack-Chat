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
    @IBOutlet weak var imageProfile: circleImage!
    @IBAction func prepareforUnwidSegue (segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)

    }


    @IBAction func loginPressed(_ sender: Any) {
        if AuthServices.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
         performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notify: Notification) {
        if AuthServices.instance.isLoggedIn{
          loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            imageProfile.image = UIImage(named: UserDataService.instance.avatarName)
            imageProfile.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            imageProfile.image = UIImage(named: "profileDefault")
            imageProfile.backgroundColor = UIColor.clear
        }
    }
    
    
    


}
