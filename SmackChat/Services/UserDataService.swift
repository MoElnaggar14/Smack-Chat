//
//  UserDataService.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/24/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    
    
    func SetUserData(id: String, name: String, email: String, avatarName: String, avatarColor: String)  {
        
        self.id = id
        self.name = name
        self.email = email
        self.avatarName = avatarName
        self.avatarColor = avatarColor
    }
    
    func SetAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
