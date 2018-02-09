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
let BASE_URL_1 = "https://localhost:3005/v1"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_REGISTER_TEST = "http://localhost:3005/v1/account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccnt"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers
let HEADER = [
    "Content-type": "application/json; charset=utf-8"
]
