//
//  MyURLs.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class MyURLs {
    static let sessionStart = "\(Constants.api)/session/start"
    static let Questions = "\(Constants.api)/admin/quiz/hold/start"
    static let QuestionsAnswer =  "\(Constants.api)/admin/quiz/hold/getAnswers"
    static let JoinQuiz   = "\(Constants.api)/quiz/action/join"
    static let media = "http://api.u10q.com/m/"
    static let askQuestion = "\(Constants.api)/admin/quiz/hold/askQuestion"
    static let showAnswer  = "\(Constants.api)/admin/quiz/hold/showAnswers"
    static let endQuiz     = "\(Constants.api)/admin/quiz/hold/endQuiz"
    static let showWinners = "\(Constants.api)/admin/quiz/hold/showWinners"
    static let getWinners  = "\(Constants.api)/admin/quiz/hold/getWinners"
}
