//
//  JNotData.swift
//  Trivia
//
//  Created by TEST on 10/22/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Arrow

struct JNotData: ArrowParsable {
    var numberUser = Int()
    var type = String()
    var event = String()
    var question = JQuestion()
    var trueAnswer = Int()
    var trueAnswerCount = [JTrueAnswerCount]()
    var cm = JComment()
    var aw = String()
    var wn = [JWn]()
    var winnersCount = Int()
    mutating func deserialize(_ json: JSON) {
        type             <-- json["tp"]
        event            <-- json["ev"]
        question         <-- json["qn"]
        numberUser       <-- json["nb"]
        trueAnswer       <-- json["cr"]
        trueAnswerCount  <-- json["an"]
        cm               <-- json["cm"]
        aw               <-- json["aw"]
        wn               <-- json["wn"]
        winnersCount     <-- json["wnc"]
        
    }
    
}

