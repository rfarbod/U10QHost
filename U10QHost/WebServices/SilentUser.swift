//
//  SilentUser.swift
//  U10QHost
//
//  Created by Farbod on 1/19/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func silentUser(username:String,isSilent:Int){
    let params:[String:Any] = [
        "username":username,
        "isSilent":isSilent
    ]
    let headers :[String:String] = [
        "t":Constants.token,
        "a":"newHeaderTHIS_@2"
    ]
    Alamofire.request(MyURLs.silentUser, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        print(response.result.value!)
    }
}
