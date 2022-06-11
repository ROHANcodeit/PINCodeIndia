//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Rohan Tyagi on 06/09/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.layer.cornerRadius = 12
        passwordView.layer.cornerRadius = 12
        registerButton.layer.cornerRadius = registerButton.frame.height/2
       
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        
            if let e = error{
                print(e.localizedDescription)
            }else{
                DatabaseManager.shared.insertUser(with: chatAppUser(emailAddress: email, password: password))
            }
        }
        }
    }
    
}
