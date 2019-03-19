//
//  WinnersLC.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
class WinnersLC {
    var vc:WinnersVC?
    init(_ vc:WinnersVC) {
        self.vc = vc
    }
    func requestWinners(quizId:String) {
        GetWinners(quizId: quizId) { (winners,winnerCount) in
            self.vc?.recievedWinners(winners: winners,winnerCount:winnerCount!)
        }
    }
}
