//
//  QuestionBrain.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//


import UIKit

struct QuestionBrain {
    
    var question = [
        Question(question: "Does your pet change food recently?", answer: ["Yes", "No"]),
        Question(question: "What is your pet source of drinking water?", answer: ["Boiled Water", "Raw Water", "Other"]),
        Question(question: "Does your pet already given Vaccine?", answer: ["Yes", "No"])
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
