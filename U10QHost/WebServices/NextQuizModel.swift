//
//  NextQuizModel.swift
//  U10QHost
//
//  Created by Farbod on 1/14/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class NextQuizModel {

    private var _id:String?
    var id:String?{
        get {return _id}
        set (new){_id = new}
    }
    private var _name:String?
    var name:String?{
        get{return _name}
        set (new){_name = new}
    }
    private var _award:String?
    var award:String?{
        get {return _award}
        set(new){_award = new}
    }
    private var _startDate:String?
    var startDate:String?{
        get{return _startDate}
        set (new){_startDate = new}
    }
    private var _status:Int?
    var status:Int? {
        get {return _status}
        set (new){_status = new}
    }

}
