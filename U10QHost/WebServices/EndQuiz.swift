//
//  EndQuiz.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func endQuiz(quizId:String) {
    let params : [String:Any] = [
        "qi":quizId
    ]
    let headers : [String:String] = [
        "t": Constants.token,
        "a":"imfromyou"
    ]
    Alamofire.request(MyURLs.endQuiz, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
         
    }
}