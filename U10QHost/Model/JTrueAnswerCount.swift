//
//  File.swift
//  Trivia
//
//  Created by TEST on 10/25/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JTrueAnswerCount: ArrowParsable {
    
    var id = Int()
    var ct = Int()
    
    mutating func deserialize(_ json: JSON) {
        id  <-- json["id"]
        ct  <-- json["ct"]
    }
    
}
