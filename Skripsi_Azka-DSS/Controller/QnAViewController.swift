//
//  QnAViewController.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 06/01/23.
//

import UIKit

class QnAViewController: UIViewController {
    
    
    @IBOutlet weak var titlefield: UITextField!
    
    var typeOfDesease = ""
    var pickerAccessory: UIToolbar?
    var picker: MyPickerView?
    var selectedValue: String?
    var rightBarButtonItem : UIBarButtonItem!
    
    var questionModel = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(confirmMainMenu))
        
        self.rightBarButtonItem = UIBarButtonItem(title: "Done", style:         UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonPressed))
        
        self.navigationItem.rightBarButtonItem = nil
        
        
        
        // Picker
        picker = MyPickerView()
        picker?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        picker?.backgroundColor = UIColor.white
        
        picker?.data = [1,2,3,4,5,6,7]
        pickerUI()
        
        
        titlefield.inputAccessoryView = pickerAccessory
        titlefield.inputView = picker
        
        title = typeOfDesease
    }
    
    @objc func confirmMainMenu() {
        navigationController?.popViewController(animated: true)
    }
    
    func pickerUI(){
        
        pickerAccessory = UIToolbar()
        pickerAccessory?.autoresizingMask = .flexibleHeight
        var frame = pickerAccessory?.frame
        frame?.size.height = 44.0
        pickerAccessory?.frame = frame!
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnClicked(_:)))
        
        cancelButton.tintColor = UIColor.red
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //a flexible space between the two buttons
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        
        doneButton.tintColor = UIColor.blue
        //Add the items to the toolbar
        pickerAccessory?.items = [cancelButton, flexSpace, doneButton]
    }
    
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        titlefield?.resignFirstResponder()
    }
    
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        titlefield?.resignFirstResponder()
        selectedValue = picker?.selectedValue
        titlefield.text = selectedValue
        questionModel.userAnswerFeases(selectedValue ?? "")

        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        
    }
    
    @objc func doneButtonPressed(){
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PilihanGandaQnAViewController") as? PilihanGandaQnAViewController {
            vc.typeOfDesease = typeOfDesease
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

class MyPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    public var data: [Int]? {
        didSet {
            super.delegate = self
            super.dataSource = self
            self.reloadAllComponents()
        }
    }
    
    public var selectedValue: String {
        get {
            if data != nil {
                return String(data![selectedRow(inComponent: 0)])
            } else {
                return ""
            }
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if data != nil {
            return data!.count
        } else {
            return 0
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if data != nil {
            return String(data![row])
        } else {
            return ""
        }
    }
}

