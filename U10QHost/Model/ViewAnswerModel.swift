//
//  ViewAnswerModel.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class ViewAnswerModel {
    private var _id:Int?
    var id:Int?{
        get{return _id}
        set(new){_id = new}
    }
    private var _ct:Int?
    var ct:Int?{
        get{return _ct}
        set(new){_ct = new}
    }
}
