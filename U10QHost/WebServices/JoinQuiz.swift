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
        "a":"newHeaderTHIS_@2"
    ]
    let params:[String:Any] = [
        "qi":questionId
    ]
    print(params)
    Alamofire.request(MyURLs.JoinQuiz, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        print(response.result.value)
         MySocket.connectSocket()
         Toast(text: "همه چی خوبه!!") .show()

    }
}

