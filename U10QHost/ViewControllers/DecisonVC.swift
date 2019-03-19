//
//  DecisonVC.swift
//  U10QHost
//
//  Created by Farbod on 1/20/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit
import Lottie
import Toaster
class DecisonVC: UIViewController {
    @IBOutlet weak var desView: UIView!
    @IBOutlet weak var lblToken: UILabel!
    @IBOutlet weak var tfToken: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    func setupAnimation() {
        let animationView = LOTAnimationView(name: "u10q")
        animationView.play()
        animationView.loopAnimation = true
        animationView.frame = self.view.frame
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        for each in self.view.subviews {
            if each != animationView {
                self.view.bringSubviewToFront(each)
            }
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func pressedTest(_ sender: UIButton) {
        Constants.api = "http://tpi.uneed.ir:7700"
        Constants.token = "JIhPUMoxP++2+OgceFWrImSlKTL6mHlxjr0zoKJxhUo="
        Constants.socket = "http://tpi.uneed.ir:7703/"
        Constants.media = "http://tpi.uneed.ir:7700/m/"
        MyURLs.media = "http://tpi.uneed.ir:7700/m/"
        self.performSegue(withIdentifier: "goToMain", sender: self)
    }
    
    @IBAction func pressedReal(_ sender: UIButton) {
        if tfToken.text?.isEmpty == true {
         Toast(text: "اجرا بدون توکن امکان پذیر نیست دلبندم").show()
        }else{
            Constants.api = "http://tpi.u10q.com:7700"
            Constants.token = tfToken.text!
//            Constants.socket = "http://tpi.u10q.com:7703/"
            Constants.socket = "http://136.243.24.203:7703/"
            Constants.media = "http://tpi.u10q.com:7700/m/"
            MyURLs.media = "http://tpi.u10q.com:7700/m/"
            self.performSegue(withIdentifier: "goToMain", sender: self)
        }
    
    }
    
}
