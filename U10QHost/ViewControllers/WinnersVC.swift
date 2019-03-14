//
//  WinnersVC.swift
//  U10QHost
//
//  Created by Farbod on 1/15/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit
import Lottie
class WinnersVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblWinnerCount: UILabel!
    var allWinners = [WinnerModel]()
    var quizId = String()
    lazy var logic = WinnersLC(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()

        logic.requestWinners(quizId: quizId)
    }
    func setupAnimation() {
        let animationView = LOTAnimationView(name: "u10q")
        animationView.contentMode = .scaleAspectFill
        animationView.play()
        animationView.loopAnimation = true
        animationView.frame = CGRect(x: 0, y: 0, width: 600, height: 600)
        self.view.addSubview(animationView)
        for each in self.view.subviews {
            if each != animationView {
                view.bringSubviewToFront(each)
            }
        }
    }
    func recievedWinners(winners:[WinnerModel],winnerCount:Int) {
         allWinners = winners
         tableView.reloadData()
        lblWinnerCount.text = "تعداد برنده‌ها:\(String(describing:winnerCount))"
        
    }
    @IBAction func dismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension WinnersVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWinners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "winnerCell", for: indexPath) as! WinnersCell
        if self.allWinners[indexPath.row].avatar != nil {
        cell.imgWinner.setMedia(hash: allWinners[indexPath.row].avatar!) { (success) in
            print("success")
        }
        }
        cell.lblWinnerName.text = allWinners[indexPath.row].username
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
}
