//
//  JResSocketAuth.swift
//  Trivia
//
//  Created by TEST on 10/21/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Arrow

struct JResSocketAuth: ArrowParsable {
    
    var quiz = String()
    
    mutating func deserialize(_ json: JSON) {
        quiz     <-- json["quiz"]
    }
    
}

