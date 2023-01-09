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
    var userFecesValue = 0
    var userMultipleChoiceValue = 0
    var isWrom = false
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionModel.screenPilihanGanda = true
        title = typeOfDesease
        topButton.isHidden = true
        navBarUI()
        fetchQuestion()
  
        print(userFecesValue)
    
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        topButton.isHidden = false
        userAnswers = String(sender.currentTitle!)

        checkAnswer()
        questionModel.nextQuestion()
        fetchQuestion()
        
        if questionModel.checkTopButton() < 2 {
            topButton.isHidden = true
        }
        
        if questionModel.moveToResultScreen == true {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
        
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
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
        
        
    }
    
    func navBarUI() {
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popViewController(animated: true)
    }
    
    func checkAnswer(){
        if question  == "Does your pet change food recently?" {
            if userAnswers == "Yes"{
                userMultipleChoiceValue += 1
            }
            else{
                userMultipleChoiceValue += 0
            }
        }
        else if question == "What is your pet source of drinking water?"{
            if userAnswers == "Raw Water"{
                userMultipleChoiceValue += 1
            }
            else{
                userMultipleChoiceValue += 0
            }
        }
       else if question == "Is there any worm in the Feces?"{
            if userAnswers == "No"{
                userMultipleChoiceValue += 0
            }
            else{
                userMultipleChoiceValue += 1
                isWrom = true
            }
        }
        
        
    }
    
}
