//
//  FallFromHighPlaceViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 09/01/23.
//

import UIKit

class FallFromHighPlaceViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var midButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    var questionModel = QuestionBrainFallFromHighPlace()
    var typeOfDesease = ""
    var userAnswers = ""
    var userMultipleChoiceValue = 0
    var question = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topButton.isHidden = true
        navBarUI()
        fetchQuestion()
        // Do any additional setup after loading the view.
        title = typeOfDesease
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
                
                vc.fromFallingHighPlace = true
                
                if userMultipleChoiceValue < 6 {
                    vc.diseaseCategory = "Low"
                    
                }
                else{
                    vc.diseaseCategory = "High"
                }
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func navBarUI() {
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchQuestion(){
        
        question = questionModel.fetchQuestion()
        questionLabel.text = question
        midButton.setTitle(questionModel.fetchAnswerMidButton(), for: .normal)
        bottomButton.setTitle(questionModel.fetchAnswerlowerButton(), for: .normal)
        
        if topButton.isHidden == false && questionModel.checkTopButton() > 1{
            topButton.setTitle(questionModel.fetchAnswerTopButton(), for: .normal)
        }
    }
    
    func checkAnswer(){
        if question  == "Blood Coming Out?"{
            if userAnswers == "No"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "From Skin" {
                userMultipleChoiceValue += 1
                
            }
            else if userAnswers == "From Nose/Butt Hole/Mouth"{
                userMultipleChoiceValue += 3
            }
        }
        else if question == "Can they move?"{
            if userAnswers == "Can't"{
                userMultipleChoiceValue += 1
            }
            else{
                userMultipleChoiceValue += 0
            }
        }
        else if question == "When walking, How many legs doesn't get use?"{
            if userAnswers == "1 Leg"{
                userMultipleChoiceValue += 1
            } else if userAnswers == "More than one leg"{
                userMultipleChoiceValue += 2
            }
            else{
                userMultipleChoiceValue += 0
            }
        }
        
        else if question == "Vomitting"{
            if userAnswers == "No"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "Yes"{
                userMultipleChoiceValue += 1
            }
            else if userAnswers == "Yes, with Blood"{
                userMultipleChoiceValue += 2
            }
        }
        else if question == "Diarrhea"{
            if userAnswers == "No"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "Yes"{
                userMultipleChoiceValue += 2
            }
            else if userAnswers == "Yes, with Blood"{
                userMultipleChoiceValue += 3
            }
        }
        else if question == "Pee"{
            if userAnswers == "Yes"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "No Peeing"{
                userMultipleChoiceValue += 1
            }
        }
        else if question == "Responses when touch"{
            if userAnswers == "Normal"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "If Coddled, They Groan"{
                userMultipleChoiceValue += 1
            }
            else if userAnswers == "If Coddled, They attack"{
                userMultipleChoiceValue += 2
            }
        }
        else if question == "Breathing"{
            if userAnswers == "Normal"{
                userMultipleChoiceValue += 0
            }
            else if userAnswers == "From Stomach"{
                userMultipleChoiceValue += 1
            }
        }
    }
    
    
    
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


