//
//  QuestionBrain.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import Foundation

struct QuestionBrain {
    
    var question = [
        Question(question: "Does your pet change food recently?", answer: ["Yes", "No"]),
        Question(question: "What is your pet source of drinking water?", answer: ["Boiled Water", "Raw Water", "Lainnya"])
    ]
    
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
    
    func userAnswerDrinking(_ answer: String){
        // Pake Core Data disini
        
        print(answer)
    }
    
    func userAnswerFeases(_ answer: String){
        // Pake Core Data disini

        print(answer)
        
    }
    
    func checkTopButton() -> Int{
        
        return question[questionNumber].answer.count - 1 
    }
    
   mutating func nextQuestion(){
       
       if questionNumber < question.count - 1{
           questionNumber += 1
       }
       else {
           questionNumber = 0
       }
       
    }
}
