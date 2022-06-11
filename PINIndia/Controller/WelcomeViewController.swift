//
//  WelcomeViewController.swift
//  ChatApp
//
//  Created by Rohan Tyagi on 06/09/21.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var logo: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.layer.cornerRadius = logo.frame.height/2
        registerButton.layer.cornerRadius = registerButton.frame.height/2
        registerButton.layer.borderWidth = 2.5
        registerButton.layer.borderColor = UIColor(named: "Color2")?.cgColor
        
        logInButton.layer.cornerRadius = registerButton.frame.height/2
        logInButton.layer.borderWidth = 2.5
        logInButton.layer.borderColor = UIColor(named: "Color1")?.cgColor
       
    }
    
}
