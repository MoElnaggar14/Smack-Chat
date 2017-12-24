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


