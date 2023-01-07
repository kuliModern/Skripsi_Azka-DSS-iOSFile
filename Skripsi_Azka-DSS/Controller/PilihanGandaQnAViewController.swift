//
//  PilihanGandaQnAViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import UIKit

class PilihanGandaQnAViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var midButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
   
    
    var typeOfDesease = ""
    var questionModel = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = typeOfDesease
        topButton.isHidden = true
        navBarUI()
        fetchQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print(sender.currentTitle)
        
    }
    
    func fetchQuestion(){
        
        questionText.text = questionModel.fetchQuestion()
        midButton.setTitle(questionModel.fetchAnswerMidButton(), for: .normal)
        lowerButton.setTitle(questionModel.fetchAnswerlowerButton(), for: .normal)
    }
    
    func navBarUI() {
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popViewController(animated: true)
    }
    
}
