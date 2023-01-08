//
//  ResultViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var userAnswer = [
        ["Question1","UserAnswer"],
        ["Question2","UserAnswer2"],
        ["Question3","UserAnswer"],
        ["Question4","UserAnswer2"]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(userAnswer)
        
        getUserAnswer()
        // Do any additional setup after loading the view.
    }
    
    
    func getUserAnswer(){
        
        let firstAnswer = userAnswer[0][1]
        let firstQuestion = userAnswer[0][0]
        print("\(firstQuestion): \(firstAnswer)")
        
    }

}
