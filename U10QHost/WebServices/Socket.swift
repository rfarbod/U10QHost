//
//  MyWebSocket.swift
//  Trivia
//
//  Created by TEST on 10/18/18.
//  Copyright © 2018 TEST. All rights reserved.
//


import SocketIO
import Arrow
import Foundation
class MySocket: NSObject {
    static var soketIsAuth = false
    static var resSocketAuth: JResSocketAuth? = nil
    
    static let manager = SocketManager(socketURL: URL(string: Constants.socket)!, config: [.log(true), .compress, .forceWebsockets(true),.reconnects(true),.reconnectWait(1)])
    static let socket = manager.defaultSocket
    // connect and listen for events
    static func connectSocket(){
        print(Constants.token)
        print(Constants.socket)
        var  paramsDic = [String:Any]()
        if Constants.token == "JIhPUMoxP++2+OgceFWrImSlKTL6mHlxjr0zoKJxhUo=" {
            paramsDic = [
                "tn":Constants.token,
                "at":"imfromyou"
                ]
        }else{
            paramsDic = ["tn":Constants.token
                ,"id":"somethingsomething"
            ]
        }
        print(Constants.token)
        socket.on("connect") { data, ack in
            socket.emitWithAck("auth", paramsDic).timingOut(after: 0) {data in
                    if let json = JSON(data[0]) {
                        var response = JResponse(JResSocketAuth.self)
                        response.deserialize(json)
                        if (response.code == .success) {
                            // everything is ok
                            soketIsAuth = true
                            resSocketAuth = response.result as? JResSocketAuth
                            EventsHelper.socketAuth()
                             
                            
                        } else {
                            // TODO::
                            print("FAILED")
                        }
                    } else {
                        print("FAILED")
                        // TODO::
                    }
            }
        }
        socket.connect()
        
        // listen to question event
        socket.on("not") { (dataArray, socketAck) -> Void in
            
            let json = JSON(dataArray[0] as! [String: Any])!
            var notification = JNot()
            notification.deserialize(json)
            if (notification.data.type == "qn" && notification.data.event == "ta") {
                EventsHelper.askQuestion()
            }
            if (notification.data.type == "qz" && notification.data.event == "nu") {
                EventsHelper.userNumber(number: notification.data.numberUser)
            }
            if (notification.data.type == "qn" && notification.data.event == "an") {
                
                EventsHelper.trueAnswerCount(trueAnswerNumber: notification.data.trueAnswer, trueAnswerCount: notification.data.trueAnswerCount)
            }
            if (notification.data.type == "cm" && notification.data.event == "nw") {
                EventsHelper.create(txt:notification.data.cm.txt, usr: notification.data.cm.usr)
            }
            
            
        }
    }
    
    
    static func disconnectSocket(){
        socket.disconnect()
    }
    
    static func emit(request: JRequest,
                     resultType: ArrowParsable.Type? = nil,
                     success: @escaping Success,
                     failure: @escaping Failure) {
        socket.emitWithAck("request", with: [request.toDictionary()]).timingOut(after: 0) { data in
            if let json = JSON(data[0]) {
                var response = JResponse(resultType.self)
                response.deserialize(json)
                if (response.code == .success) {
                    // everything is ok
                    success(response)
                } else {
                    failure(response)
                }
            } else {
                failure(JResponse.noResponse)
            }
        }
    }
    
    
}



