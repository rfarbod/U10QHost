//
//  EventsHelper.swift
//  Uneed
//
//  Created by Sina Khalili on 7/7/18.
//  Copyright © 2018 Uneed. All rights reserved.
//

import Foundation
import UIKit

/*
 Global events can be occured and observed here!
 */
class EventsHelper {
    
    static let shared = EventsHelper()
    
    private init() {
    
    }
    
    static func setup() {
        _ = shared
    }
    
    // called when keyboard shown
    @objc func keyboardWillShow(notification: NSNotification) {

    }
    // called when keyboard shown
    @objc func keyboardWillHide(notification: NSNotification) {
    
    }
    
    // keyboard shown
  
    
  
    // socket auth
    private static let SocketAuth = Notification.Name("SocketAuth")
    static func socketAuth() {
        NotificationCenter.default.post(name: SocketAuth, object: nil, userInfo: nil)
    }
    static func observeSocketAuth(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: SocketAuth, object: nil)
    }
    
    // question is start
    private static let AskQuestion = Notification.Name("AskQuestion")
    static func askQuestion() {
        NotificationCenter.default.post(name: AskQuestion, object: nil, userInfo: nil)
    }
    static func observeAskQuestion(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: AskQuestion, object: nil)
    }
    
    // changes of user number
    private static let UserNumber = Notification.Name("UserNumber")
    static func userNumber(number: Int) {
        NotificationCenter.default.post(name: UserNumber, object: nil, userInfo: ["number": number])
    }
    static func observeUserNumber(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: UserNumber, object: nil)
    }
    //showing asnwer
    private static let TrueAnswerCount = Notification.Name("TrueAnswerCount")
    static func trueAnswerCount(trueAnswerNumber: Int, trueAnswerCount: [JTrueAnswerCount]) {
        NotificationCenter.default.post(name: TrueAnswerCount, object: nil, userInfo: ["number": trueAnswerNumber, "trueAnswerCount": trueAnswerCount])
    }
    static func observeTrueAnswerCount(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: TrueAnswerCount, object: nil)
    }

    // showing comment
    private static let Create = Notification.Name("Create")
    static func create(txt: String,usr: JUserComment) {
        NotificationCenter.default.post(name: Create, object: nil, userInfo: ["txt": txt , "usr":usr])
    }
    static func observeCreate(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: Create, object: nil)
    }
    // winners list
    private static let WinnersList = Notification.Name("WinnersList")
    static func winnersList(winnersCount:Int , winner: [JWn]) {
        NotificationCenter.default.post(name: WinnersList, object: nil, userInfo: ["wnc": winnersCount, "wn": winner])
    }
    static func observeWinnersList(_ vc: UIViewController, with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: WinnersList, object: nil)
    }
    
    
}
