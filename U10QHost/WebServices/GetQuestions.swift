//
//  GetQuestions.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
import Toaster
func GetQuestions(questionId:String,completion:@escaping (([QuestionModel],QuizInfoModel)->())){
    let headers:[String:String] = [
        "t":Constants.token,
        "a":"newHeaderTHIS_@2"
    ]
    let params:[String:Any] = [
        "qi":questionId
    ]
    print(params)
    Alamofire.request(MyURLs.Questions, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        var Questions:[QuestionModel] = []
        let QuizInfo = QuizInfoModel()
        print(MyURLs.Questions)
        print(response.result.value)
        let responseJSON = response.result.value as? [String:Any]
        if let responseUW = responseJSON {
            let result = responseUW["result"] as? [String:Any]
            if let resultUW = result {
                
                let quiz = resultUW["quiz"] as? [String:Any]
                let award = quiz!["award"] as? [String:Any]
                QuizInfo.type = award!["type"] as? Int
                let info = award!["info"] as? [String:Any]
                QuizInfo.amount = info!["amount"] as? Int
                QuizInfo.amounts = info!["amounts"] as? [Int]
                let stream = quiz!["stream"] as? [String:Any]
                QuizInfo.streamLink = stream!["link"] as? String
                QuizInfo.streamLinks = stream!["links"] as? [String]
                QuizInfo.usableLifes = quiz!["usableLifes"] as? Int
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
                }else{
                    Toast(text: "کووییز نداریم دلبندم").show()
                }
                completion(Questions,QuizInfo)
            }
        }
    }
}
//"award": {
//    "type": 0,
//    "info": {
//        "amount": 200000,
//        "currency": "Toman"
//    },
//    "text": "بیست هزار ریال"
//},
//"stream": {
//    "links": [],
//    "link": "rtmp://185.13.230.158/live/livestream",
//    "chatBackground": "#44000000"
//},

