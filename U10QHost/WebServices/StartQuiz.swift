//
//  GetQuestions.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func StartQuiz(questionId:String) {
    let headers:[String:String] = [
        "t":Constants.token,
        "a":"imfromyou"
    ]
    let params:[String:Any] = [
        "qi":questionId
    ]
    Alamofire.request(MyURLs.Start, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
          print(response)
          JoinQuiz(questionId: questionId)
        
    }
}
