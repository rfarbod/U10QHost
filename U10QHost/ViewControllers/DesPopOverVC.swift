//
//  DesPopOverVC.swift
//  U10QHost
//
//  Created by Farbod on 1/14/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit
class DesPopOverVC: UIViewController {
    var questions = [QuestionModel]()
    var selectedCellBounds = CGRect()
    var quizId = String()
    var selectedQuestion = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
     
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "submitDes" {
            let vc = segue.destination as! SubmitDesVC
            vc.quizId = self.quizId
            vc.questionIndex = selectedQuestion
        }
    }

}
extension DesPopOverVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count          
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as! QuestionCell
        cell.lblQTitle.text = questions[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let cell = tableView.cellForRow(at: indexPath)
          selectedCellBounds = cell!.bounds
          selectedQuestion = indexPath.row
          self.performSegue(withIdentifier: "submitDes", sender: self)
    }
    
    
}
