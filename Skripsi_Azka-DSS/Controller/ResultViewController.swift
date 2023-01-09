//
//  ResultViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 07/01/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var diseaseCategory = "High"
    var isWorm = false
    var fromFallingHighPlace = false
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResuilt: UIImageView!
    @IBOutlet weak var labelRecomendation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserAnswer()
        navBarUI()
        // Do any additional setup after loading the view.
    }
    
    
    func getUserAnswer(){
        
        if diseaseCategory == "Low" {
            imageResuilt.image = UIImage(named: "Low_Risk_logo")
            labelResult.text = "Low Risk"
            
            if fromFallingHighPlace == true {
                labelRecomendation.text = "Recommendation: Please rest your pet in their cage"
            } else if isWorm == true{
                labelRecomendation.text = "Recomendation: Let your cat to fasting for 6 hour and please give worm medicine for your pet"
            } else {
                labelRecomendation.text = "Recomendation: Please let your pet fasting for 6 hour"
            }
            
        } else if diseaseCategory == "Medium" {
            
            imageResuilt.image = UIImage(named: "MediumRisk_logo")
            labelResult.text = "Medium Risk"
        
             if isWorm == true{
                    labelRecomendation.text = "Recomendation: Give electrolyte or oralit medicine for your pet and give worm medicine"
                } else{
                    labelRecomendation.text = "Recomendation: Give electrolyte or oralit medicine for your pet"
                }
            }
            
            
        else {
            imageResuilt.image = UIImage(named: "Emergency_logo")
            labelResult.text = "EMERGENCY"
            labelResult.textColor = .red
            labelRecomendation.text = "Please Immidiatly Visit the nearest Vet Available"
        }
    }
    
    func navBarUI() {
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popToRootViewController(animated: true)
    }

}
