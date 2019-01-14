//
//  JUserComment.swift
//  Trivia
//
//  Created by TEST on 11/12/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JUserComment: ArrowParsable {
    
    var _id = String()
    var username = String()
    var avatar  = String()
    var phc = Int()
    var phi = Int()
    mutating func deserialize(_ json: JSON) {
        _id              <-- json["_id"]
        username        <-- json["username"]
        avatar          <-- json["avatar"]
        phc            <-- json["phc"]
        phi            <-- json["phi"]
    }
    
}
