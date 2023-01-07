//
//  PilihanGandaQnAViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import UIKit
import CoreData

class PilihanGandaQnAViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var midButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
   
    
    var typeOfDesease = ""
    var questionModel = QuestionBrain()
    var feasesScore = 0
    var arrayUserAnswer = Desease()
    var question = ""
    var userAnswers = ""
    
    var userAnswer = [
        ["Question1","UserAnswer"],
        ["Question2","UserAnswer2"],
        ["Question3","UserAnswer"],
        ["Question4","UserAnswer2"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = typeOfDesease
        topButton.isHidden = true
        navBarUI()
        fetchQuestion()
        print(feasesScore)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        topButton.isHidden = false
        userAnswers = String(sender.currentTitle!)
        
        
         userAnswer[questionModel.questionNumbers()][1] = userAnswers
         print(userAnswer)
        
        questionModel.nextQuestion()
        fetchQuestion()
        
        if questionModel.checkTopButton() < 2 {
            topButton.isHidden = true
        }
        
       
    }
    
    func fetchQuestion(){
        
        question = questionModel.fetchQuestion()
        questionText.text = question
        midButton.setTitle(questionModel.fetchAnswerMidButton(), for: .normal)
        lowerButton.setTitle(questionModel.fetchAnswerlowerButton(), for: .normal)
        
        if topButton.isHidden == false && questionModel.checkTopButton() > 1{
            topButton.setTitle(questionModel.fetchAnswerTopButton(), for: .normal)
        }
        
        userAnswer[questionModel.questionNumbers()][0] = questionModel.fetchQuestion()
      
        
    }
    
    func navBarUI() {
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popViewController(animated: true)
    }
    
}
