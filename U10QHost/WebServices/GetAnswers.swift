//
//  GetAnswers.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func getAnswers(questionId:String,questionIndex:Int,completion:@escaping ((GetAnswerModel)->())) {
    let headers:[String:String] = [
        "t":Constants.token,
        "a":"imfromyou"
    ]
    let params:[String:Any] = [
        "qi": questionId,
        "qn":questionIndex
    ]
    Alamofire.request(MyURLs.QuestionsAnswer, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        let viewAnswer = GetAnswerModel()
        let responseJSON = response.result.value as? [String:Any]
        if let responseUW = responseJSON {
            let result = responseUW["result"] as? [String:Any]
            if let resultUW = result {
                let answers = resultUW["answers"] as? [NSDictionary]
                if let answersUW = answers {
                    for each in answersUW {
                        let singleAnswer = ViewAnswerModel()
                        singleAnswer.ct = each["ct"] as? Int
                        singleAnswer.id = each["id"] as? Int
                        viewAnswer.answers.append(singleAnswer)
                    }
                    viewAnswer.correct = resultUW["correct"] as? Int
                    completion(viewAnswer)
                }
            }
        }
    }
    
}
