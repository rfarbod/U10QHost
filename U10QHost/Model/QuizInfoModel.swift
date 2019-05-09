//
//  QuizInfoModel.swift
//  U10QHost
//
//  Created by Farbod on 4/7/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class QuizInfoModel {
    private var _streamLink:String?
    var streamLink:String?{
        get{return _streamLink}
        set(new){_streamLink = new}
    }
    private var _streamLinks:[String]?
    var streamLinks:[String]?{
        get{return _streamLinks}
        set(new){_streamLinks = new}
    }
    private var _type:Int?
    var type:Int? {
        get{return _type}
        set(new){_type = new}
    }
    private var _amount:Int?
    var amount:Int?{
        get{return _amount}
        set(new){_amount = new}
    }
    private var _amounts:[Int]?
    var amounts:[Int]? {
        get{return _amounts}
        set(new){_amounts = new}
    }
    private var _usableLifes:Int?
    var usableLifes:Int?{
        get{return _usableLifes}
        set(new){_usableLifes = new}
    }
}

