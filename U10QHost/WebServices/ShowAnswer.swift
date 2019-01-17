//
//  ShowAnswer.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func showAnswer(quizId:String,questionIndex:Int) {
    let params:[String:Any] = [
        "qi":quizId,
        "qn":questionIndex
    ]
    let headers:[String:String] = [
        "t":Constants.token
    ]
    Alamofire.request(MyURLs.showAnswer, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (success) in
        
    }
}
