//
//  QuestionBrain.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import Foundation

struct QuestionBrain {
    
    var question = Question(question: "Does your pet change food recently?", answer: ["Yes", "No"])
    
    func fetchQuestion() -> String {
        return question.question
    }
    
    func fetchAnswerMidButton() -> String {
        return question.answer[0]
    }
    func fetchAnswerlowerButton() -> String {
        return question.answer[1]
    }
}
