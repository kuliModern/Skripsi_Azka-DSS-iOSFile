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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
