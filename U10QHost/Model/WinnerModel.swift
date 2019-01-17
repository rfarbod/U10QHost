//
//  WinnerModel.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class WinnerModel {
    private var _username:String?
    var username:String?{
        get{return _username}
        set(new){_username = new}
    }
    private var _id:String?
    var id:String?{
        get{return _id}
        set(new){_id = new}
    }
    private var _phc:Int?
    var phc:Int?{
        get{return _phc}
        set(new){_phc = new}
    }
    private var _phi:Int?
    var phi:Int?{
        get{return _phi}
        set(new) {_phi = new}
    }
    private var _avatar:String?
    var avatar:String?{
        get{return _avatar}
        set(new){_avatar = new}
    }
}
