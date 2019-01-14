//
//  JRequest.swift
//  Trivia
//
//  Created by TEST on 10/21/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JRequest {
    
    var controllerNamePath = String()
    var methodName = String()
    var args = Dictionary<String, Any>()
    
    func toDictionary() -> Dictionary<String, Any> {
        return [
            "cp": controllerNamePath,
            "mn": methodName,
            "ag": args]
    }
    
}
