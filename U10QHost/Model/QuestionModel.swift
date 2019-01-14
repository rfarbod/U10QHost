//
//  QuestionModel.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class QuestionModel {
    var answers = [AnswerModel]()
    private var _id:String?
    var id:String?{
        get {return _id}
        set(new){_id = new}
    }
    private var _answer:Int?
    var answer:Int?{
        get{return _answer}
        set(new) {_answer = new}
    }
    private var _lifeUsage:Bool?
    var lifeUsage:Bool?{
        get {return _lifeUsage}
        set (new){_lifeUsage = new}
    }
    private var _text:String?
    var text:String?{
        get{return _text}
        set(new){_text = new}
    }
}
