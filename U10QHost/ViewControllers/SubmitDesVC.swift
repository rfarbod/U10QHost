//
//  SubmirDesVC.swift
//  U10QHost
//
//  Created by Farbod on 1/14/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit
import RealmSwift
class SubmitDesVC: UIViewController {
    @IBOutlet weak var txtDes: UITextView!
    var quizId        = String()
    var questionIndex = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let realm = try! Realm()
        try! realm.write {
            let question = Question()
            question.quizId = self.quizId
            question.questionIndex = self.questionIndex
            question.descriptionText = txtDes.text!
            realm.add(question)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
