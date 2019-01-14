//
//  JNot.swift
//  Trivia
//
//  Created by TEST on 10/22/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JNot: ArrowParsable {
    
    var title = String()
    var subtitle = String()
    var data = JNotData()
    
    
    mutating func deserialize(_ json: JSON) {
        title      <-- json["title"]
        subtitle   <-- json["subtitle"]
        data       <-- json["data"]
       
    }

}
