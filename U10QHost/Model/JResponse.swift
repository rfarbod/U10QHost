//
//  JResponse.swift
//  Uneed
//
//  Created by Sina Khalili on 7/7/18.
//  Copyright © 2018 Uneed. All rights reserved.
//

import Foundation
import ArrowParsable

struct JResponse: ArrowParsable {
    
    // id used to identify requests in socket
    var id                  : String?       = nil
    
    var code                : ResponseCodes = .Err_Unknown
    var message:            String?         = nil
    
    var result:             ArrowParsable?  = nil
    
    init() {}
    
    init(_ resultType: ArrowParsable.Type?) {
        self.result = resultType?.init()
    }
    
    mutating func deserialize(_ json: JSON) {
        id      <-- json["id"]
        code    <-- json["code"]
        message <-- json["message"]
        if let jsonResult = json["result"] {
            result?.deserialize(jsonResult)
        }
    }
    
    mutating func parse(_ dictionary: Any?) {
        if let json = JSON(dictionary as? NSDictionary) {
            deserialize(json)
        } else {
            self = JResponse.noResponse
        }
    }
    
    static var notConnected: JResponse {
        get {
            var response = JResponse()
            response.code = .app_noConnection
            response.message = "خطا در اتصال اینترنت"
            return response
        }
    }
    
    static var noResponse: JResponse {
        get {
            var response = JResponse()
            response.code = .app_serverDown
            response.message = "خطا در برقراری ارتباط با سرور"
            return response
        }
    }
    
}
