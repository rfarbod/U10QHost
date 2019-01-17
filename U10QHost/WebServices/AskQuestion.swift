//
//  AskQuestion.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func askQuestion(quizId:String,questionIndex:Int,completion:@escaping((Bool)->())) {
    let params:[String:Any] = [
        "qi":quizId,
        "qn":questionIndex
    ]
    let headers:[String:String] = [
        "t": Constants.token
    ]
    Alamofire.request(MyURLs.askQuestion, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
    
    }
}
