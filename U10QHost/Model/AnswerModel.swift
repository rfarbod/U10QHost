//
//  AnswerModel.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class AnswerModel {
    private var _id:String?
    var id:String?{
        get {return _id}
        set(new){_id = new}
    }
    private var _answerid:Int?
    var answerid:Int?{
        get {return _answerid}
        set(new){_answerid = new}
    }
    private var _text:String?
    var text:String?{
        get {return _text}
        set(new){_text = new}
    }
}
