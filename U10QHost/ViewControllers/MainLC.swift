//
//  MainLC.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import RealmSwift
class MainLC {
    var mainVC:MainVC?
    init(_ vc:MainVC) {
        self.mainVC = vc
    }
    func requestQuestions() {
        getQuestionId { (string) in
            print(string)
            if string.id != nil {
            GetQuestions(questionId: string.id!, completion: { (questions) in
                self.mainVC?.questionsRecived(questions:questions)
                self.mainVC?.quizId = string.id!
                self.mainVC?.descriptionTxt = self.getDes(quizId: string.id!)
                JoinQuiz(questionId: string.id!)
    
            })
            }
        }
    }
    func requestAnswer(questionId:String,questionIndex:Int,completion:@escaping ((GetAnswerModel)->())) {
        getAnswers(questionId: questionId, questionIndex: questionIndex) { (viewAnswer) in
            completion(viewAnswer)
        }
    }
    func getDes(quizId:String) -> [Question] {
        let realm = try! Realm()
        var des = [Question]()
        let objects = realm.objects(Question.self).filter("quizId == %@",quizId)
        for each in objects {
            des.append(each)
        }
        return des
    }
    func askAQuestion(quizId:String,questionIndex:Int) {
        askQuestion(quizId: quizId, questionIndex: questionIndex) { (success) in
            if success == true {
                print("success")
            }
        }
    }
    func showAnAnswer(quizId:String,questionIndex:Int) {
        showAnswer(quizId: quizId, questionIndex: questionIndex)
    }
    func endAQuiz(quizId:String) {
        endQuiz(quizId: quizId)
    }
    func showAWinners(quizId:String) {
        showWinners(quizId: quizId)
    }
   
}
