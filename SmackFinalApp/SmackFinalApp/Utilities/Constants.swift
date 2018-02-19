//
//  Constants.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/1/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "https://chattychatsonaliapi.herokuapp.com/v1/"
let BASE_URL_1 = "http://localhost:3005/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_REGISTER_TEST = "http://localhost:3005/v1/account/register"
let URL_LOGIN = "\(BASE_URL_1)account/login"
let URL_USER_ADD = "\(BASE_URL_1)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL_1)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL_1)channel/"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccnt"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Colors
let smackPurplePlaceHolder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

//Notifications Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
// Headers
let HEADER = [
    "Content-type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
