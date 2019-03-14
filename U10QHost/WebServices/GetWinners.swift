//
//  GetWinners.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import Alamofire
func GetWinners(quizId:String,completion:@escaping (([WinnerModel],Int?)->())) {
    var allWinners = [WinnerModel]()
    let params:[String:Any] = [
        "qi":quizId
    ]
    let header:[String:String] = [
        "t":Constants.token
    ]
    Alamofire.request(MyURLs.getWinners, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).validate().responseJSON { (response) in
        let responseJSON = response.result.value as? [String:Any]
        if let responseJSONUW = responseJSON {
            let result = responseJSONUW["result"] as? [String:Any]
            if let resultUW = result {
                let winnerCount = resultUW["winnersCount"] as? Int
                let winners = resultUW["winners"] as? [NSDictionary]
                for each in winners! {
                    let singleWinner = WinnerModel()
                    singleWinner.avatar = each["avatar"] as? String
                    singleWinner.id = each["_id"] as? String
                    singleWinner.phc = each ["phc"] as? Int
                    singleWinner.phi = each["phi"] as? Int
                    singleWinner.username = each["username"] as? String
                    allWinners.append(singleWinner)
                }
              completion(allWinners,winnerCount)
            }
        }
    }
}
