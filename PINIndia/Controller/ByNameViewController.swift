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
        
        DispatchQueue.main.async{
            self.theNameResultLabel.text=name.Pincode
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
