//
//  JQuestionAnswer.swift
//  Trivia
//
//  Created by TEST on 10/22/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JQuestionAnswer: ArrowParsable {
    
    var id = Int()
    var tx = String()
    
    mutating func deserialize(_ json: JSON) {
        id  <-- json["id"]
        tx  <-- json["tx"]
    }
    
}
