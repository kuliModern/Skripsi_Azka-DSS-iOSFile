//
//  QuestionBrain.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//


import UIKit

struct QuestionBrainFallFromHighPlace {
    
    var question = [
       
        Question(question: "Can they move?", answer: ["Can","Can't"]),
        Question(question: "Blood Coming Out?", answer: ["No","From Skin","From Nose/Butt Hole/Mouth"]),
        Question(question: "When walking, How many legs doesn't get use?", answer: ["All of them are in use", "1 Leg","More than one leg"]),
        Question(question: "Vomitting", answer: ["Yes", "No","Yes, with Blood"]),
        Question(question: "Diarrhea", answer: ["No", "Yes", "Yes, with Blood"]),
        Question(question: "Pee", answer: ["Yes","No Peeing"]),
        Question(question: "Responses when touch", answer: ["Normal","If Coddled, They Groan","If Coddled, They attack"]),
        Question(question: "Breathing", answer: ["Normal","From Stomach"])
        
    ]
    
    var userAnswer: [String] = []
    var moveToResultScreen = false
    var screenPilihanGanda = false
    var questionNumber = 0
    
    mutating func fetchQuestion() -> String {
        return question[questionNumber].question
        
    }
    
    func fetchAnswerTopButton() -> String {
        return question[questionNumber].answer[2]
    }
    
    func fetchAnswerMidButton() -> String {
        return question[questionNumber].answer[0]
    }
    func fetchAnswerlowerButton() -> String {
        return question[questionNumber].answer[1]
    }
    
    func checkTopButton() -> Int{
        
        return question[questionNumber].answer.count - 1
    }
    
    func questionNumbers() -> Int{
        if screenPilihanGanda == false{
            return questionNumber
        } else {
            return questionNumber + 1
        }
       
    }
    
   mutating func nextQuestion(){
       
       if questionNumber < question.count - 1{
           questionNumber += 1
           moveToResultScreen = false
       }
       else {
           moveToResultScreen = true
           questionNumber = 0
       }
       
    }
}
