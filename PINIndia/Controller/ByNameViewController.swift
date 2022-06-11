//
//  ByNameViewController.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 26/12/21.
//

import UIKit

class ByNameViewController: UIViewController,UITextFieldDelegate,nameManagerDelegate{


    @IBOutlet weak var theNameResultLabel: UILabel!
    @IBOutlet weak var nameSearchTextField: UITextField!
    
    let nameManager = NameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        nameSearchTextField.delegate=self
        nameManager.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameSearchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = nameSearchTextField.text {
            nameManager.fetchName(name: name)
        }
    }

    func didUpdateName(_ nameManager: NameManager, name: NameModel) {
        
        DispatchQueue.main.async{            self.theNameResultLabel.text=name.Pincode
            self.theNameResultLabel.layer.cornerRadius = 10
            self.theNameResultLabel.layer.borderWidth = 2.5
            self.theNameResultLabel.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
