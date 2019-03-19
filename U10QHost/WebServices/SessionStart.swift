//
//  SessionStart.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import  Alamofire
func getQuestionId(completion:@escaping ((NextQuizModel)->())) {
    let headers :[String:String] = [
        "t":"\(Constants.token)",
        "a":"imfromyou"
    ]
    let params:[String:Any] = [
        "pl":2,
        "bl":30,
        "di":"testing",
        "dn":"iPad",
        "os":"11.2.5"
    ]
   let url = MyURLs.sessionStart
    Alamofire.request(url, method: .post, parameters: params , encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        let nextQuizR = NextQuizModel()
        print(response.result.value)
        let responseJSON = response.result.value as? [String:Any]
        if let responseJSONUW = responseJSON {
            let result = responseJSONUW["result"] as? [String:Any]
            if let resultUW = result {
                let nextQuiz = resultUW["nextQuiz"] as? [String:Any]
                if let nextQuizUW = nextQuiz {
                nextQuizR.id = nextQuiz!["_id"] as? String
                nextQuizR.name = nextQuiz!["_name"] as? String
                nextQuizR.award = nextQuiz!["award"] as? String
                nextQuizR.startDate = nextQuiz!["startDate"] as? String
                nextQuizR.status = nextQuiz!["status"] as? Int
                }
                completion(nextQuizR)
            }
        }
    }
}
