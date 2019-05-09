//
//  showWinners.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func showWinners(quizId:String) {
    let params:[String:Any] = [
        "qi":quizId
    ]
    let headers:[String:String] = [
        "t":Constants.token,
        "a":"newHeaderTHIS_@2"
    ]
    Alamofire.request(MyURLs.showWinners, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        
    }
}
