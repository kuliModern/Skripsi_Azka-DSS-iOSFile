//
//  ViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 06/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var deseaseTableView: UITableView!
    
    var desease: [TypeOfQuestion] =
    
    [
        TypeOfQuestion(deseaseName: "Diare"),
        TypeOfQuestion(deseaseName: "Jatoh dari tempat tinggi")
    ]
    
    var deseaseSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        deseaseTableView.dataSource = self
        deseaseTableView.delegate = self
        deseaseTableView.rowHeight = 90
        deseaseTableView.backgroundColor = UIColor.clear
        deseaseTableView.register(UINib(nibName: "DeseaseType", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = deseaseTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DeseaseType
        
        // Cell UI
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        
        cell.labelDesease.text = desease[indexPath.section].deseaseName
        cell.imageDesease.image = UIImage(named: "Anjing_Diare")
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        deseaseSelected = desease[indexPath.section].deseaseName
        
        if deseaseSelected == desease[0].deseaseName { // Diare Kepilih
            if let vc = storyboard?.instantiateViewController(withIdentifier: "QnAViewController") as? QnAViewController {
                vc.typeOfDesease = deseaseSelected
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else { // Jatuh dari ketinggian
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "FallFromHighPlaceViewController") as? FallFromHighPlaceViewController {
                vc.typeOfDesease = deseaseSelected
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}

