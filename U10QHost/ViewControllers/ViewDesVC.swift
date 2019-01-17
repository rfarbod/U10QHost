//
//  ViewDesVC.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class ViewDesVC: UIViewController {
    @IBOutlet weak var txtDes: UITextView!
    var des = String()
    override func viewDidLoad() {
        super.viewDidLoad()
         txtDes.text = des
       
    }
    @IBAction func pressedDismiss(_ sender: UIButton) {
        self.dismiss(animated: true) {
            mainVC?.descriptionTxt  = (mainVC?.logic.getDes(quizId: (mainVC?.quizId)!))!
        }
        
    }
    

}
