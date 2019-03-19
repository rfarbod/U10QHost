//
//  JoinQuiz.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
import Toaster
func JoinQuiz(questionId:String) {
    let headers:[String:String] =
    [
        "t":Constants.token,
        "a":"imfromyou"
    ]
    let params:[String:Any] = [
        "qi":questionId
    ]
    Alamofire.request(MyURLs.JoinQuiz, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
         MySocket.connectSocket()
         Toast(text: "همه چی خوبه!!") .show()

    }
}

