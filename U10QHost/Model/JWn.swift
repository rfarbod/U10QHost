//
//  JWn.swift
//  Trivia
//
//  Created by TEST on 11/21/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JWn: ArrowParsable {
    var username  = String()
    var _id = String()
    var phc = Int()
    var phi = Int()
    
    mutating func deserialize(_ json: JSON) {
        username  <-- json["username"]
        _id       <-- json["_id"]
        phc       <-- json["phc"]
        phi       <-- json["phi"]
    }
}
