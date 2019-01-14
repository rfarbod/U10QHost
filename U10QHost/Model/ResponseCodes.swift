//
//  ResponseCodes.swift
//  Uneed
//
//  Created by Sina Khalili on 7/7/18.
//  Copyright © 2018 Uneed. All rights reserved.
//

import Foundation

enum ResponseCodes: Int {
    
    case app_noConnection       = -1
    case app_serverDown         = -2
    
    case success                = 0
    
    case Err_Unknown            = 1000
    case Err_ControllerNotFound = 1001
    case Err_MethodNotFound     = 1002
    case Err_ACL                = 1003
    case Err_ACL_Restart        = 1004
    case Err_BadRequest         = 1010
    
    // user authentication errors
    case Err_Auth_WrongCode     = 1100
    case Err_Auth_ManyAttempts  = 1101
    case Err_Auth_TimedOut      = 1102
    //case err_Auth_WrongPassword = 1110
    case Err_Auth_Blocked      = 1103
    
    var isAppError: Bool {
        return rawValue < 0
    }
    
}
