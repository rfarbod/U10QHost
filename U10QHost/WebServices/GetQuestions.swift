//
//  GetQuestions.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func GetQuestions(questionId:String,completion:@escaping (([QuestionModel])->())){
    let headers:[String:String] = [
        "t":Constants.token
    ]
    let params:[String:Any] = [
        "qi":questionId
    ]
    Alamofire.request(MyURLs.Questions, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        var Questions:[QuestionModel] = []
        let responseJSON = response.result.value as? [String:Any]
        if let responseUW = responseJSON {
            let result = responseUW["result"] as? [String:Any]
            if let resultUW = result {
                let quiz = resultUW["quiz"] as? [String:Any]
                let questions = quiz!["questions"] as? [Any]
                if let questionsUW = questions {
                    for each in questionsUW {
                     let singleQuestion = QuestionModel()
                        let eachDic = each as? [String:Any]
                        singleQuestion.id = eachDic?["_id"] as? String
                        singleQuestion.lifeUsage = eachDic?["lifeUsage"] as? Bool
                        singleQuestion.text = eachDic?["text"] as? String
                        singleQuestion.answer = eachDic?["answer"] as? Int
                        let answers = eachDic!["answers"] as? [NSDictionary]
                        for answer in answers! {
                            let singleAnswer = AnswerModel()
                             singleAnswer.id = answer["_id"] as? String
                             singleAnswer.answerid = answer["id"] as? Int
                             singleAnswer.text = answer["text"] as? String
                             singleQuestion.answers.append(singleAnswer)
                        }
                       Questions.append(singleQuestion)
                    }
                }
                completion(Questions)
            }
        }
    }
}
