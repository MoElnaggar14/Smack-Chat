//
//  AuthService.swift
//  SmackChat
//
//  Created by Mohammed Elnaggar on 12/23/17.
//  Copyright © 2017 Mohammed Elnaggar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthServices {
    
    static let instance = AuthServices()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_KEY)
        }
        set {
            return defaults.set(newValue, forKey: LOGGED_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            return defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            return defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func RegisterUserEmail (email: String, password: String, Completion: @escaping CompletionHandeler) {
        
        let emailLowerCase = email.lowercased()
        
      
        let body : [String: Any] = [
            "email": emailLowerCase,
            "password": password
        ]
        
        Alamofire.request(User_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEAD).responseString { (response) in
            
            if response.result.error == nil {
                Completion(true)
            } else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func LoginUserEmail (email: String, password: String, Completion: @escaping CompletionHandeler) {
        
        let emailLowerCase = email.lowercased()
        let body : [String: Any] = [
            "email": emailLowerCase,
            "password": password
        ]
        
        Alamofire.request(User_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEAD).responseJSON { (response) in
          if response.result.error == nil {
            // using SwiftyJSON
            guard let data = response.data else { return }
            do {
            let result = try JSON(data: data)
            self.userEmail = result["user"].stringValue
            self.authToken = result["token"].stringValue
            
            self.isLoggedIn = true
            Completion(true)
            } catch let err as NSError {
                print(err.debugDescription)
            }
            } else {
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func CreateUser (name: String, email: String, avatarName: String, avatarColor: String, Compleation: @escaping CompletionHandeler) {
        let emailLowerCase = email.lowercased()
        
        let header = [
            "Authorization": "Bearer \(authToken)",
            "Content-Type": "application/json; charset =utf-8"
        ]
        let body: [String: Any] = [
            "name": name,
            "email": emailLowerCase,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(User_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (respone) in
            
            if respone.result.error == nil {
                guard let data = respone.data else {return}
                do {
                let result = try JSON(data: data)
                    let id = result["id"].stringValue
                    let name = result["name"].stringValue
                    let email = result["email"].stringValue
                    let avatarName = result["avatarName"].stringValue
                    let avatarColor = result["avatarColor"].stringValue
                    UserDataService.instance.SetUserData(id: id, name: name, email: email, avatarName: avatarName, avatarColor: avatarColor)
                    
            
                Compleation(true)
                
                } catch let err as NSError {
                    print(err.debugDescription)
                }
            } else {
                Compleation(false)
                debugPrint(respone.result.error as Any)
            }
        }
    }
    
    
    
}
