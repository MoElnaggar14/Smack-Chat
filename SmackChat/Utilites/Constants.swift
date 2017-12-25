//
//  Constants.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/18/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import Foundation

// Herkuo don't sleep



// Seques
let TO_LOGIN = "to_login"
let TO_CREATEACCOUNT = "toCreateAccount"
let UNWIND_TOCHANNEL = "unwindToChannel"
let TO_AVATARPICKER = "toAvatarPicker"

// User defaults
let LOGGED_KEY = "is Logged"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

//Colors
let smackPurpleColor = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notifications
let NOTIFY_USER_DATA_DID_CHANGE = Notification.Name("notifyUserDataChanged")

// CompletionHandeler
typealias CompletionHandeler = (_ Succeeded: Bool) -> ()

// Headers
let HEAD = [
    "Content-Type": "application/json; charset =utf-8"
]
// URL
let Base_URL = "https://mosmackchaty.herokuapp.com/v1/"
let User_REGISTER = "\(Base_URL)account/register"
let User_LOGIN = "\(Base_URL)account/login"
let User_ADD = "\(Base_URL)user/add"


