//
//  ByPinViewController.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 26/12/21.
//

import UIKit

class ByPinViewController: UIViewController,UITextFieldDelegate,pinManagerDelegate{
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var thePinResultLabel: UILabel!
    
    let pinManager = PinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        searchTextField.delegate=self
        pinManager.delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
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
        if let pin = searchTextField.text {
            pinManager.fetchName(pin: pin)
        }
    }

    func didUpdatePin(_ pinManager: PinManager, pin: PinModel) {
        
        DispatchQueue.main.async{
            self.thePinResultLabel.text=pin.Name
            self.thePinResultLabel.layer.cornerRadius = 10
            self.thePinResultLabel.layer.borderWidth = 2.5
            self.thePinResultLabel.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
