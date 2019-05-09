//
//  InfoVC.swift
//  U10QHost
//
//  Created by Farbod on 4/7/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var streamLinks = [String]()
    var awards = [Int]()
    var usableLifes = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
}
extension InfoVC:UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return streamLinks.count
        case 1:
            return awards.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.configure(text: streamLinks[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.configure(text: String(describing :awards[indexPath.row].persianDigits))
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.configure(text: "تعداد جان های قابل استفاده: \(usableLifes)")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
