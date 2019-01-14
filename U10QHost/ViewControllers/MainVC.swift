//
//  ViewController.swift
//  U10QHost
//
//  Created by Farbod on 1/13/19.
//  Copyright © 2019 Farbod. All rights reserved.
//

import UIKit
import Lottie
import Spring
import Kingfisher
class MainVC: UIViewController {
    @IBOutlet weak var lblQuestionStatus: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblUserNumber: UILabel!
    @IBOutlet weak var btnPrev: DesignableButton!
    @IBOutlet weak var btnNext: DesignableButton!
    @IBOutlet weak var lblAnswer3: UILabel!
    @IBOutlet weak var lblAnswer2: UILabel!
    @IBOutlet weak var lblAnswe1: UILabel!
    @IBOutlet weak var viewAnswer3: DesignableView!
    @IBOutlet weak var viewAnswer2: DesignableView!
    @IBOutlet weak var viewAnswer1: DesignableView!
    @IBOutlet weak var questionTitle: UILabel!
    var chats:[String] = []
    var usernames:[JUserComment] = []
    var questions:[QuestionModel] = []
    var currentQuestion:Int = 0
    var correctAnswer:Int = 0
    var quizId = String()
    lazy var logic = MainLC(self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        EventsHelper.observeUserNumber(self, with: #selector(userNumber))
        EventsHelper.observeCreate(self, with: #selector(create))
        EventsHelper.observeAskQuestion(self, with: #selector(questionShowed))
        EventsHelper.observeTrueAnswerCount(self, with: #selector(answerShowed))
        logic.requestQuestions()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func nextQuestion(_ sender: DesignableButton) {
        currentQuestion = currentQuestion + 1
        if currentQuestion < questions.count  {
            setupViews(currentQuestion: currentQuestion)
        }
    }
    @IBAction func showCorrectAnswer(_ sender: DesignableButton) {
        logic.requestAnswer(questionId: quizId, questionIndex: currentQuestion) { (correctAnswer) in
            self.setupAnswer(correctAnswer: correctAnswer)
        }
    }
    @IBAction func prevQuestion(_ sender: DesignableButton) {
        if currentQuestion != 0 {
            currentQuestion = currentQuestion - 1
            setupViews(currentQuestion: currentQuestion)
        }
    }
    @objc func questionShowed(notification: Notification) {
        lblQuestionStatus.text = "سوال نمایش داده شد"
    }
    @objc func answerShowed(notification:Notification) {
        lblQuestionStatus.text = "جواب نمایش داده شد"
    }
    @objc func create(notification: Notification) {
       let comment
            = notification.userInfo!["txt"] as! String
        let user = notification.userInfo!["usr"] as! JUserComment
        usernames.append(user)
        chats.append(comment)
        tableView.reloadData()
        
        
    }
    @objc func userNumber(notification: Notification) {
        let numberOfUsers = notification.userInfo!["number"] as! Int
        lblUserNumber.text = "تعداد شرکت کنندگان:\(numberOfUsers.persianDigits)"
    }
    func questionsRecived(questions:[QuestionModel]) {
        self.questions = questions
        currentQuestion = 0
        setupViews(currentQuestion: currentQuestion)
    }
    func setupAnswer(correctAnswer:GetAnswerModel) {
        switch correctAnswer.correct! {
        case 1:
            viewAnswer1.backgroundColor = Colors.correctColor
            viewAnswer2.backgroundColor = Colors.wrongColor
            viewAnswer3.backgroundColor = Colors.wrongColor
        case 2:
            viewAnswer1.backgroundColor = Colors.wrongColor
            viewAnswer2.backgroundColor = Colors.correctColor
            viewAnswer3.backgroundColor = Colors.wrongColor
        case 3:
            viewAnswer1.backgroundColor = Colors.wrongColor
            viewAnswer2.backgroundColor = Colors.wrongColor
            viewAnswer3.backgroundColor = Colors.correctColor
        default:
             break
        }
        lblAnswe1.text = "\(lblAnswe1.text!)   :    \(correctAnswer.answers[0].ct!)"
        lblAnswer2.text = "\(lblAnswer2.text!)   :    \(correctAnswer.answers[1].ct!)"
        lblAnswer3.text = "\(lblAnswer3.text!)   :    \(correctAnswer.answers[2].ct!)"
    }
    func setupViews(currentQuestion:Int) {
        
        questionTitle.text = "\(String(describing :currentQuestion + 1)) - \(questions[currentQuestion].text!)"
        viewAnswer1.backgroundColor = Colors.defaultColor
        viewAnswer2.backgroundColor = Colors.defaultColor
        viewAnswer3.backgroundColor = Colors.defaultColor
        switch questions[currentQuestion].answer! {
        case 1:
            viewAnswer1.backgroundColor = Colors.correctColor
        case 2:
            viewAnswer2.backgroundColor = Colors.correctColor
        case 3:
            viewAnswer3.backgroundColor = Colors.correctColor
        default:
            break
        }
        lblAnswe1.text = questions[currentQuestion].answers[0].text
        lblAnswer2.text = questions[currentQuestion].answers[1].text
        lblAnswer3.text = questions[currentQuestion].answers[2].text
        if currentQuestion > questions.count - 2 {
            btnNext.isHidden = true
        }else{
            btnNext.isHidden = false
        }
        if currentQuestion != 0 {
            btnPrev.isHidden = false
        }else{
            btnPrev.isHidden = true
        }
    }
    func setupAnimation(){
        let animationView = LOTAnimationView(name: "u10q")
        animationView.contentMode = .scaleAspectFill
        animationView.frame = view.frame
        animationView.play()
        animationView.loopAnimation = true
        view.addSubview(animationView)
        for each in view.subviews {
            if each != animationView {
                view.bringSubviewToFront(each)
            }
        }
    }
    
    
}
extension MainVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatCell
        cell.lblUserComment.text = "\(usernames[indexPath.row].username) : \(chats[indexPath.row])"
        cell.lblUserComment.textColor = UIColor.white
        cell.lblUserComment.textAlignment = .right
        cell.imgUserImage.layer.cornerRadius = cell.imgUserImage.bounds.width / 2
        cell.imgUserImage.clipsToBounds = true
        cell.imgUserImage.setMediaChat(hash: usernames[indexPath.row].avatar) { (success) in
        }
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        if usernames[indexPath.row].avatar == "" {
        cell.imgUserImage.isHidden = true
        cell.lblAvatar.isHidden = false
        cell.lblAvatar.layer.cornerRadius = cell.lblAvatar.bounds.width / 2
        cell.lblAvatar.clipsToBounds = true
        if usernames[indexPath.row].phi == 0 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 1 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 2 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 3 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 4 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 5 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 6 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 7 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phi == 8 {
            cell.lblAvatar.text = ""
        }
        if usernames[indexPath.row].phc == 0 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.9371426702, green: 0.3715914786, blue: 0.6390573382, alpha: 1)
        }
        if usernames[indexPath.row].phc == 1 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.5055744052, green: 0.6988918185, blue: 0.9978558421, alpha: 1)
        }
        if usernames[indexPath.row].phc == 2 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.4861186147, green: 0.7281808257, blue: 0.3694030643, alpha: 1)
        }
        if usernames[indexPath.row].phc == 3 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.3364245892, green: 0.3485516906, blue: 0.4403974116, alpha: 1)
        }
        if usernames[indexPath.row].phc == 4 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0, green: 0.6099954247, blue: 1, alpha: 1)
        }
        if usernames[indexPath.row].phc == 5 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 1, green: 0.78460747, blue: 0.1036339626, alpha: 1)
        }
        if usernames[indexPath.row].phc == 6 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.9375909567, green: 0.2589409649, blue: 0.2135760784, alpha: 1)
        }
        if usernames[indexPath.row].phc == 7 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.6934742332, green: 0.6788045764, blue: 0.9914799333, alpha: 1)
        }
        if usernames[indexPath.row].phc == 8 {
            cell.lblAvatar.backgroundColor = #colorLiteral(red: 0.9650786519, green: 0.6654891968, blue: 0.07282014936, alpha: 1)
        }
        }
        return cell
    }
    
    
}


