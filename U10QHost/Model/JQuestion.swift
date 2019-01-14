//
//  JQuestion.swift
//  Trivia
//
//  Created by TEST on 10/22/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JQuestion: ArrowParsable {
    
    var answers = [JQuestionAnswer]()
    var text = String()
    
    
    mutating func deserialize(_ json: JSON) {
        answers        <-- json["ar"]
        text           <-- json["tx"]
    }
    
}
