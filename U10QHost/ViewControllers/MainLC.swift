//
//  MainLC.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class MainLC {
    var mainVC:MainVC?
    init(_ vc:MainVC) {
        self.mainVC = vc
    }
    func requestQuestions() {
        getQuestionId { (string) in
            print(string)
            GetQuestions(questionId: string, completion: { (questions) in
                self.mainVC?.questionsRecived(questions:questions)
                self.mainVC?.quizId = string
                JoinQuiz(questionId: string)
    
            })
        }
    }
    func requestAnswer(questionId:String,questionIndex:Int,completion:@escaping ((GetAnswerModel)->())) {
        getAnswers(questionId: questionId, questionIndex: questionIndex) { (viewAnswer) in
            completion(viewAnswer)
        }
    }
}
