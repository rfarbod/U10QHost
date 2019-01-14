//
//  GetAnswerModel.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class GetAnswerModel {
    var answers = [ViewAnswerModel]()
    private var _correct:Int?
    var correct:Int?{
        get{return _correct}
        set(new){_correct = new}
    }
}
