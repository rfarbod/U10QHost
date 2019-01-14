//
//  Jcomment.swift
//  Trivia
//
//  Created by TEST on 11/12/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JComment: ArrowParsable {
    
    var usr = JUserComment()
    var txt = String()
    
    mutating func deserialize(_ json: JSON) {
        usr        <-- json["usr"]
        txt         <-- json["txt"]
    }
    
}
