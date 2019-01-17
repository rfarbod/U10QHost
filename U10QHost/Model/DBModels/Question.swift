//
//  Quiz.swift
//  U10QHost
//
//  Created by Farbod on 1/14/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import Foundation
import RealmSwift
class Question:Object {
    @objc dynamic var quizId        = String()
    @objc dynamic var questionIndex = Int()
    @objc dynamic var descriptionText = String()
}
